class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to current_user
    else
      render 'new'
    end
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email or password.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "You are logged out!"
    redirect_to root_url
  end


end
