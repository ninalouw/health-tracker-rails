class Api::BaseController < ApplicationController
  before_action :authenticate
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if user_signed_in?
  # end
  # helper_method :current_user

  private

  def authenticate
    api_key = params[:api_key] || request.headers['Authorization']
    @api_user = User.find_by api_key: api_key
    head :unauthorized unless @api_user
  end

  # Using JWT Token
  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      user = User.find(auth["user"])
      if user
        @current_user ||= user
      end
    end
  end
  helper_method :current_user

  def authenticate
    render json: {error: "unauthorized"}, status: 401 unless logged_in?
  end

private

  def token
    request.env["HTTP_AUTHORIZATION"].scan(/Bearer
      (.*)$/).flatten.last
  end

  def auth
    Auth.decode(token)
  end

  def auth_present?
    !!request.env.fetch("HTTP_AUTHORIZATION",
      "").scan(/Bearer/).flatten.first
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end

end
