class Student < ApplicationRecord
  belongs_to :user, optional: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :address, presence: true
  validates :civil_status, presence: true
  validates :gender, presence: true
  validates :course, presence: true
  validates :year_level, presence: true
  validates :mother_name, presence: true
  validates :father_name, presence: true
  validates :parent_address, presence: true
  validates :birthday, presence: true
  validates :birth_place, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :phone_number, presence: true
  validates :att_elem, presence: true
  validates :att_hs, presence: true

  def self.courses
    ['Bachelor of Science in Information Technology',
     'Bachelor of Science in Business Administration',
     'Bachelor of Science in Criminology']
  end

  def self.year_levels
    %w[I II III IV]
  end
end
