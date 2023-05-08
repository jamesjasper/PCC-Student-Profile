class Student < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence:true
  validates :middle_name, presence: true
  validates :course, presence: true
  validates :year_level, presence: true
  validates :mother_name, presence: true
  validates :father_name, presence: true
  validates :region, presence: true
  validates :province, presence: true
  validates :municipality, presence: true
  validates :barangay, presence: true
  validates :zipcode, presence: true
end
