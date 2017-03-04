class User < ApplicationRecord
  has_secure_password

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, length: {minimum: 2}, presence: true
  validates :last_name, length: {minimum: 2}, presence: true
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :password, length: {in: 7..20}, :presence => true

  before_save do
      self.email.downcase!
      self.first_name.downcase!
      self.last_name.downcase!
    end
end
