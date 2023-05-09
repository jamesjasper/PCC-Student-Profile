class Student < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, presence: true
  validates :last_name, presence:true
  validates :middle_name, presence: true
  validates :course, presence: true
  validates :year_level, presence: true
  validates :mother_name, presence: true
  validates :father_name, presence: true

  def self.courses
    ['Bachelor of Science in Information Technology',
     'Bachelor of Science in Business Administration',
     'Bachelor of Science in Criminology']
  end

  def self.year_levels
    %w[I II III IV]
  end
end
