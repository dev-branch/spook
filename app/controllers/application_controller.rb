class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_user

  private

  def get_user
    @is_user = user_signed_in?
    @user = current_user
  end
end
