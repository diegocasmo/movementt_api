class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  skip_after_action :verify_authorized, only: [:create]

  # @route POST /api/v1/users (api_v1_users)
  def create
    return json_response(current_user) if current_user.present?

    raise ApplicationController::Unauthorized if payload.blank?
    user = User.find_or_create_by!(
      uid: payload[:user_id],
      email: payload[:email],
      verified: payload[:email_verified],
    )

    json_response(user)
  end

  # @route PUT /api/v1/users/verify (verify_api_v1_users)
  def verify
    authorize(current_user)

    if payload[:email_verified].present?
      current_user.update!(verified: true)
    end

    json_response(current_user)
  end

  # @route PATCH /api/v1/users/:id (api_v1_user)
  # @route PUT /api/v1/users/:id (api_v1_user)
  def update
    authorize(current_user)

    attrs = permitted_attributes(current_user)
    UserService::Update.call(
      user: current_user,
      weight_unit_type: attrs[:weight_unit_type],
      distance_unit_type: attrs[:distance_unit_type],
    )

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
