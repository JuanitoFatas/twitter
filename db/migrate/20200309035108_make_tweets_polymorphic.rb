class MakeTweetsPolymorphic < ActiveRecord::Migration[6.1]
  class Tweet < ApplicationRecord
    belongs_to :content, polymorphic: true
  end
  class TextTweet < ApplicationRecord; end

  def change
    change_table(:tweets) do |t|
      t.string :content_type, null: false
      t.integer :content_id, null: false
      t.index [:content_type, :content_id]
    end

    reversible do |direction|
      Tweet.reset_column_information
      Tweet.find_each do |tweet|
        direction.up do
          text_tweet = TextTweet.create!(body: tweet.body)
          tweet.update(content_id: text_tweet.id, content_type: "TextTweet")
        end

        direction.down do
          tweet.update(body: tweet.content.body)
          tweet.content.destroy
        end
      end

    end

    remove_column :tweets, :body, :string
  end
end
