class AddReferenceToStudents < ActiveRecord::Migration[6.1]
  def change
    add_reference :students, :user, null: true, foreign_key: true
    add_index :students, [:user_id, :created_at]
  end
end
