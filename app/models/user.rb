class User < ApplicationRecord
  has_many :students, dependent: :nullify
  validates :username, presence: true, length: {maximum:20}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
end
