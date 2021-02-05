class ApplicationController < ActionController::API
  class Unauthorized < StandardError; end

  include Firebase::Auth::Authenticable
  include Pundit
  include Response
  include ExceptionHandler

  before_action :authenticate_user
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
end
