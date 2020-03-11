class DashboardsController < ApplicationController
  def show
    @tweet = Tweet.new
    @tweets = current_user.timeline_tweets
  end
end
