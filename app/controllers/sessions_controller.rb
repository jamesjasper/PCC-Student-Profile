class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      flash.now[:success] = "Welcome " + @user.username + "!"
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email or password.'
      render 'new'
    end

  end

  def delete
    log_out
    redirect_to root_url
  end
end
