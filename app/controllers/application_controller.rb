class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_domain

  APP_DOMAIN = 'dianewillis.com'

  private

  def ensure_domain
    return unless Rails.env.production?
    return if request.env['HTTP_HOST'] == APP_DOMAIN

    redirect_to "http://#{APP_DOMAIN}#{request.path}", status: :moved_permanently
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
  end
  helper_method :current_user

  def require_login
    redirect_to login_url, notice: 'Please login first' unless current_user
  end
end
