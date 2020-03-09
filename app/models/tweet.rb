class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
