class TweetsController < ApplicationController
  def create
    tweet = current_user.tweets.create(tweet_params)

    redirect_to root_path, redirect_options_for(tweet)
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    { content: content_from_params }
  end

  def content_from_params
    case params[:tweet][:content_type]
    when "TextTweet" then TextTweet.new(text_tweet_content_params)
    when "PhotoTweet" then PhotoTweet.new(photo_tweet_content_params)
    end
  end

  def text_tweet_content_params
    params.require(:tweet).require(:content).permit(:body)
  end

  def photo_tweet_content_params
    params.require(:tweet).require(:content).permit(:image)
  end

  def redirect_options_for(tweet)
    if tweet.persisted?
      { notice: "Tweeted successfully" }
    else
      { alert: "Cannot tweet" }
    end
  end
end
