class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      cookies[:auth_token] = user.auth_token
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password invalid'
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: 'Logged out!'
  end
end
