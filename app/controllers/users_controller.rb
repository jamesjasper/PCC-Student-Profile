# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :update, :edit]

  # GET /users or /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1 or /users/1.json
  def show
    set_user
    @students = @user.students.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    unless @students.nil?
      @student = @students.first
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    set_user
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "User #{@user.username} added successfully!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    set_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    set_user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name)
  end

  #check if user.role is adin else redirect to root_url
  def admin_user
    redirect_to root_url unless admin?
  end

  #checks if user is accessing its own files or is admin
  def correct_user
    set_user
    redirect_to(root_url) unless current_user?(@user) || admin?
  end
end