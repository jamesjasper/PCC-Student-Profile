class Student < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, :middle_name, :phone_number, presence: true
end
