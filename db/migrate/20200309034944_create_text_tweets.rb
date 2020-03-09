class CreateTextTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :text_tweets do |t|
      t.string :body, null: false

      t.timestamps
    end
  end
end
