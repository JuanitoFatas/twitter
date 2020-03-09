class User < ActiveRecord::Base
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true

  has_many :tweets, dependent: :destroy
end
