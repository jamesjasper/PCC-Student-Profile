class Student < ApplicationRecord
  after_commit :add_default_img, on: %i[create update]
  belongs_to :user, optional: true
  scope :search_by_name, ->(name) { where("CONCAT_WS(' ', first_name, last_name) ILIKE ?", "%#{name}%") }
  scope :search_by_name_and_course, lambda { |name, course|
                                      where("(CONCAT_WS(' ', first_name, last_name)) ILIKE ? AND course ILIKE ?",
                                            "%#{name}%", "%#{course}%") }
  scope :search_by_name_and_year, lambda { |name, year|
                                      where("(CONCAT_WS(' ', first_name, last_name)) ILIKE ? AND year_level ILIKE ?",
                                            "%#{name}%", "%#{year}%") }

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
  has_one_attached :image

  def self.courses
    ['Bachelor of Science in Information Technology',
     'Bachelor of Science in Business Administration',
     'Bachelor of Science in Criminology']
  end

  def self.year_levels
    %w[I II III IV]
  end

  def self.search_options
    [['Name', ['name']],
     ['Course', ['Bachelor of Science in Information Technology',
                 'Bachelor of Science in Business Administration',
                 'Bachelor of Science in Criminology']],
     ['Year Level', %w[I II III IV]]]
  end

  def add_default_img
    unless image.attached?
      image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.jpeg')),
                        filename: 'default.jpg', content_type: 'image/jpg')
    end
  end

  def display_image
    image.variant(resize_to_limit: [80, 80])
  end
end
