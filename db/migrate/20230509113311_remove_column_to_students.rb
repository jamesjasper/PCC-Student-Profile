class RemoveColumnToStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :region
    remove_column :students, :province
    remove_column :students, :municipality
    remove_column :students, :barangay
    remove_column :students, :zipcode
    remove_column :students, :street
  end
end
