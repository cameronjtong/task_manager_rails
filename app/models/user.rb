class User < ApplicationRecord
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name, presence: true, length: { maximum: 70 })
  validates(
    :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }
  )
  validates(:password, length: { minimum: 6 })
  has_secure_password

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end
end
