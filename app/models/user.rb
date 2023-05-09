class User < ApplicationRecord
    has_many :students

    before_save { self.email = self.email.to_s.downcase }
    validates :username, presence: true, length: {maximum: 20}, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 50},
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: true
    validates :password, length: {minimum: 6}, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :role, presence: true
    has_secure_password
end
