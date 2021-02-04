module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ApplicationController::Unauthorized, with: :unauthorized
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    private

    def unauthorized
      head(:unauthorized)
    end

    def record_not_found e
      json_response({ message: e.message }, :not_found)
    end

    def record_invalid e
      json_response({ message: e.message }, :unprocessable_entity)
    end
  end
end
