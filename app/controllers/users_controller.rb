# frozen_string_literal: true
class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :show, :new]
  before_action :correct_user, only: [:edit, :update, :show]
  before_action :admin_user, only: [:destroy, :new]

  # GET /users or /users.json
  def index
    @users = User.paginate(page: params[:page]).per_page(10)
    if params[:keyword]
      @users = User.search_by_name(params[:keyword]).paginate(page: params[:page])
    end
  end

  # GET /users/1 or /users/1.json
  def show
    set_user
    @students = @user.students.order(created_at: :desc).paginate(page: params[:page], per_page: 15)
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
      flash[:success] = "User #{@user.username} added successfully!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    set_user
    if @user.update(user_params)
      flash[:success] = "User #{ @user.username } was successfully updated."
      redirect_to user_url
    else
      render 'edit'
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    set_user
    if !@user.nil?
      flash[:danger] = "User #{@user.username} was successfully deleted!"
      @user.destroy
      redirect_to users_path
    else
      flash[:danger] = "Something is wrong cannot delete user!"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :role, :image)
  end

  #check if user.role is adin else redirect to root_url
  def admin_user
    redirect_to root_url unless admin?
  end

  def correct_user
    set_user
    redirect_to(root_url) unless @user == current_user || admin?
  end
end