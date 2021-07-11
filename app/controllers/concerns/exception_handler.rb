module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ApplicationController::Unauthorized, with: :unauthorized
    rescue_from ActionController::ParameterMissing, with: :bad_request
    rescue_from Pundit::NotAuthorizedError, with: :unauthorized
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    private

    def unauthorized
      json_response(nil, :unauthorized)
    end

    def record_not_found e
      json_response(nil, :not_found)
    end

    def bad_request e
      json_response(e.message, :bad_request)
    end

    def record_invalid e
      json_response(e.record.errors.messages, :unprocessable_entity)
    end
  end
end
