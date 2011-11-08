class ApplicationController < ActionController::Base
  protect_from_forgery

  private

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
