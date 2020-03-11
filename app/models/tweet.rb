class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  delegate :username, to: :user
end
