class User < ApplicationRecord
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true,
    length: {maximum: Settings.user.name_max_length}
  validates :password, presence: true,
    length: {minimum: Settings.user.password_min_length}
  validates :email, presence: true,
    length: {maximum: Settings.user.email_max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  has_secure_password

  private
  def downcase_email
    self.email = email.downcase
  end
end
