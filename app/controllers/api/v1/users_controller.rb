class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:me]
  skip_after_action :verify_authorized, only: [:me]

  # @route GET /api/v1/users/me (me_api_v1_users)
  def me
    return json_response(current_user) if current_user.present?

    logger.info("\n\n----------here----------")
    logger.info(current_user)
    logger.info(payload)
    logger.info("----------here----------\n\n")

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
