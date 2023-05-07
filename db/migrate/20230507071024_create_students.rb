class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :course
      t.string :year_level
      t.string :email
      t.string :phone_number
      t.string :region
      t.string :province
      t.string :municipality
      t.string :barangay
      t.integer :zipcode
      t.string :street
      t.string :phone_number
      t.string :mother_name
      t.string :father_name
      t.string :spouse
      t.integer :user_id

      t.timestamps
    end
  end
end
