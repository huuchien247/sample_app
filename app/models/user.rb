class User < ApplicationRecord
  before_save { email.downcase! }
byebug
  validates :name, presence: true, length: { maximum: Settings.model.user.name.lenght}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: Settings.model.user.email.lenght },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { maximum: Settings.model.user.password.lenght }
end
