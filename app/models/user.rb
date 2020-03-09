class User < ActiveRecord::Base
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
end
