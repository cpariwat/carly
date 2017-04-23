class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :doorkeeper_authorize!

  rescue_from  ActionController::ParameterMissing, with: :render_error_message
  rescue_from  ActiveRecord::RecordNotFound, with: :render_error_message

  def render_error_message(error)
    render json: {status: 'error', message: error.message}
  end
end
