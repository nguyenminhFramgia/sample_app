class SessionsController < ApplicationController
  def create
    session = params[:session]
    user = User.find_by email: session[:email].downcase
    if user && user.authenticate(session[:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = t ".invalid_email_pass"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
