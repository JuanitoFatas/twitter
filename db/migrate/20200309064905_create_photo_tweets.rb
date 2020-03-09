class CreatePhotoTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_tweets do |t|
      t.text :image_data, null: false

      t.timestamps
    end
  end
end
