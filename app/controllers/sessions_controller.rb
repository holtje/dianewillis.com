class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      login_success(user)
    else
      login_failed
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private

  def login_success(user)
    session[:user_id] = user.id
    redirect_to root_url, notice: 'Logged in!'
  end

  def login_failed
    flash.now.alert = 'Invalid username or password'
    render 'new'
  end
end
