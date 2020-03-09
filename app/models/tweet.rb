class Tweet < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { in: 1..280 }
  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
