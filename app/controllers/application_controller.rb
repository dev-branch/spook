class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_user

  private

  def get_user
    @user = current_user
    @is_auth = user_signed_in?
    @is_user = @is_auth && @user.role == 'user'
    @is_admin = @is_auth && @user.role == 'admin'
  end

  def auth_admin
    redirect_to root_url if !@is_admin
  end

  def auth_user
    redirect_to root_url if !@is_user
  end
end
