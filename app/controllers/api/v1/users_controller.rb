class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:me]
  skip_after_action :verify_authorized, only: [:me]

  # @route GET /api/v1/users/me (me_api_v1_users)
  def me
    return json_response(current_user) if current_user.present?

    raise ApplicationController::Unauthorized if payload.blank?
    user = User.find_or_create_by!(
      uid: payload[:user_id],
      email: payload[:email],
      verified: payload[:email_verified],
    )

    json_response(user)
  end

  # @route PATCH /api/v1/users/:id (api_v1_user)
  # @route PUT /api/v1/users/:id (api_v1_user)
  def update
    authorize(current_user)

    current_user.update!(permitted_attributes(current_user))

    json_response(current_user)
  end

  private

  def token
    request.headers['Authorization']&.split&.last
  end

  def payload
    @payload ||= FirebaseIdToken::Signature.verify(token)&.deep_symbolize_keys
  end
end
