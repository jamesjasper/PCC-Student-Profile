class User < ApplicationRecord
  has_many :students, dependent: :nullify
  after_commit :add_default_img, on: %i[create update]

  attr_accessor :remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :students
  before_save { self.email = email.to_s.downcase }
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true

  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, length: { minimum: 6 }, presence: true, allow_nil: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  has_one_attached :image

  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def add_default_img
    unless image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.jpeg')),
                        filename: 'default.jpg', content_type: 'image/jpg')
    end
  end

  def display_image
    image.variant(resize_to_limit: [200, 200])
  end
end
