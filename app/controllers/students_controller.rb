# frozen_string_literal: true
class StudentsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :create, :update, :destroy]
  before_action :correct_user, only: :destroy
  # GET /students or /students.json
  def index
    @students = Student.order(params[:sort]).paginate(page: params[:page])
    @students = Student.search_by_name(params[:keyword]).paginate(page: params[:page]) if params[:filter] == 'name'
    if Student.courses.include?(params[:filter])
      @students = Student.search_by_name_and_course(params[:keyword], params[:filter]).paginate(page: params[:page])
    elsif Student.year_levels.include?(params[:filter])
      @students = Student.search_by_name_and_year(params[:keyword], params[:filter]).paginate(page: params[:page])
    end
  end

  # GET /students/1 or /students/1.json
  def show
    set_student
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    set_student
  end

  # POST /students or /students.json
  def create
    @student = current_user.students.build(student_params)

    if @student.save
      flash[:success] = "Student #{"#{@student.first_name} #{@student.last_name}"} was successfully added!"
      redirect_to @student
    else
      render 'edit'
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    set_student

    if !@student.user_id.nil?
      @student.user_id = current_user.id
    end
    
    if @student.update(student_params)
      flash[:success] = "Student #{"#{@student.first_name} #{@student.last_name}"} was successfully updated."
      redirect_to student_url
    else
      render 'edit'
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    set_student
    if !@student.nil?
      flash[:success] = "Student #{"#{@student.first_name} #{@student.last_name}"} was successfully deleted."
      @student.destroy
    else
      flash[:danger] = 'There was a problem deleting student.'
    end
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:first_name, :middle_name, :last_name, :course, :year_level,
                                    :email, :phone_number, :address, :mother_name, :father_name,
                                    :spouse, :att_elem, :att_hs, :att_coll, :religion, :parent_address,
                                    :fb_account, :birthday, :birth_place, :gender, :civil_status, :image,
                                    :filter, :keyword)
  end

  def correct_user
    @student = current_user.students.find_by(id: params[:id])
    redirect_to(root_url) unless admin? || !@student.nil?
  end
end
