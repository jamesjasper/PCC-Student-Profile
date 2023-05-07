require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { barangay: @student.barangay, course: @student.course, email: @student.email, father_name: @student.father_name, first_name: @student.first_name, last_name: @student.last_name, middle_name: @student.middle_name, mother_name: @student.mother_name, municipality: @student.municipality, phone_number: @student.phone_number, province: @student.province, region: @student.region, spouse: @student.spouse, street: @student.street, user_id: @student.user_id, year_level: @student.year_level, zipcode: @student.zipcode } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { barangay: @student.barangay, course: @student.course, email: @student.email, father_name: @student.father_name, first_name: @student.first_name, last_name: @student.last_name, middle_name: @student.middle_name, mother_name: @student.mother_name, municipality: @student.municipality, phone_number: @student.phone_number, province: @student.province, region: @student.region, spouse: @student.spouse, street: @student.street, user_id: @student.user_id, year_level: @student.year_level, zipcode: @student.zipcode } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
