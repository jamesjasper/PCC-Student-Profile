require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Barangay", with: @student.barangay
    fill_in "Course", with: @student.course
    fill_in "Email", with: @student.email
    fill_in "Father name", with: @student.father_name
    fill_in "First name", with: @student.first_name
    fill_in "Last name", with: @student.last_name
    fill_in "Middle name", with: @student.middle_name
    fill_in "Mother name", with: @student.mother_name
    fill_in "Municipality", with: @student.municipality
    fill_in "Phone number", with: @student.phone_number
    fill_in "Province", with: @student.province
    fill_in "Region", with: @student.region
    fill_in "Spouse", with: @student.spouse
    fill_in "Street", with: @student.street
    fill_in "User", with: @student.user_id
    fill_in "Year level", with: @student.year_level
    fill_in "Zipcode", with: @student.zipcode
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Barangay", with: @student.barangay
    fill_in "Course", with: @student.course
    fill_in "Email", with: @student.email
    fill_in "Father name", with: @student.father_name
    fill_in "First name", with: @student.first_name
    fill_in "Last name", with: @student.last_name
    fill_in "Middle name", with: @student.middle_name
    fill_in "Mother name", with: @student.mother_name
    fill_in "Municipality", with: @student.municipality
    fill_in "Phone number", with: @student.phone_number
    fill_in "Province", with: @student.province
    fill_in "Region", with: @student.region
    fill_in "Spouse", with: @student.spouse
    fill_in "Street", with: @student.street
    fill_in "User", with: @student.user_id
    fill_in "Year level", with: @student.year_level
    fill_in "Zipcode", with: @student.zipcode
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
