class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "application.logged_in_user.please_log_in"
      redirect_to login_url
    end
  end
end
