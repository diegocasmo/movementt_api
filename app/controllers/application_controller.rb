class ApplicationController < ActionController::API
  class Unauthorized < StandardError; end

  include Firebase::Auth::Authenticable
  include Response
  include ExceptionHandler

  before_action :authenticate_user
end
