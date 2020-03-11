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
    params[:content_type].new(content_params)
  end

  def content_params
    params.require(:tweet).require(:content).permit(:body, :image)
  end

  def redirect_options_for(tweet)
    if tweet.persisted?
      { notice: "Tweeted successfully" }
    else
      { alert: "Cannot tweet" }
    end
  end
end
