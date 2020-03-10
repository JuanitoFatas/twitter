class User < ActiveRecord::Base
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true

  has_many :tweets, dependent: :destroy
  has_many :likes
  has_many :liked_tweets, through: :likes, source: :tweet

  def like(tweet)
    liked_tweets << tweet
  end

  def unlike(tweet)
    liked_tweets.destroy(tweet)
  end

  def liked?(tweet)
    liked_tweet_ids.include? tweet.id
  end

end
