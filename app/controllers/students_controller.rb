# frozen_string_literal: true
class StudentsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :edit, :create, :update, :destroy]
  before_action :admin_user, only: [:destroy, :edit, :update]
  # GET /students or /students.json
  def index
    @students = Student.order(params[:sort]).paginate(page: params[:page])
    @students = Student.search_by_name(params[:keyword]).paginate(page: params[:page]) if params[:filter] == 'name'
    #@students = current_user.students if params[]
    if Student.courses.include?(params[:filter])
      @students = Student.search_by_name_and_course(params[:keyword], params[:filter]).paginate(page: params[:page])
    elsif Student.year_levels.include?(params[:filter])
      @students = Student.search_by_name_and_year(params[:keyword], params[:filter]).paginate(page: params[:page])
    end
  end

  # GET /students/1 or /students/1.json
  def show
    @student = Student.find(params[:id])
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students or /students.json
  def create
    @student = current_user.students.build(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    @student = Student.find(params[:id])
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    Student.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
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

  def admin_user
    redirect_to root_url unless admin?
  end

  def correct_user
    @student = @user.student
    redirect_to(root_url) unless current_user?(@user) || admin?
  end
end
