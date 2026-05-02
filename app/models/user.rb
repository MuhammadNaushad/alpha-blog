class User < ApplicationRecord
  has_many :articles
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  EMAIL_REGEX =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }, length: { maximum: 100 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }, length: { maximum: 100 }
end
