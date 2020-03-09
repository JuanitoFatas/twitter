class PhotoTweet < ApplicationRecord
  include ImageUploader::Attachment(:image)
end
