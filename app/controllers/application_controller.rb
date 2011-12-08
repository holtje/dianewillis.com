class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_domain

  APP_DOMAIN = 'dianewillis.com'

  private

  def ensure_domain
    return unless Rails.env.production?
    if request.env['HTTP_HOST'] != APP_DOMAIN
      redirect_to "http://#{APP_DOMAIN}#{request.path}", :status => :moved_permanently
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_login
    unless current_user
      redirect_to login_url, :notice => "Please login first"
    end
  end
end
