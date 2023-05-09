class RemoveUserIdToStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :user_id
  end
end
