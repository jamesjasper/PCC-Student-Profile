class AddColumnsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :birthday, :date
    add_column :students, :birth_place, :string
    add_column :students, :att_elem, :string
    add_column :students, :att_hs, :string
    add_column :students, :att_coll, :string
    add_column :students, :civil_status, :string
    add_column :students, :fb_account, :string
    add_column :students, :religion, :string
    add_column :students, :parent_address, :string
    add_column :students, :address, :string
  end
end
