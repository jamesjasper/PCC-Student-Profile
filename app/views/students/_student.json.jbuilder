json.extract! student, :id, :first_name, :middle_name, :last_name, :course, :year_level, :email, :phone_number, :region, :province, :municipality, :barangay, :zipcode, :street, :phone_number, :mother_name, :father_name, :spouse, :user_id, :created_at, :updated_at
json.url student_url(student, format: :json)
