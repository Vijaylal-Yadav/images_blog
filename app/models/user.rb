class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :username, uniqueness: { case_sensitive: false },
            presence: true, length: {minimum: 3, maximum: 25}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, uniqueness: { case_sensitive: false },
            presence: true, length: {maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }

  has_many :albums, dependent: :destroy

  has_secure_password
end