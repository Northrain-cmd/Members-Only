class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_user.nil?
  end

  def edit_rights?(content)
    current_user == content.user
  end
  helper_method :edit_rights?
end
