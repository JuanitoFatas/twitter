class DashboardsController < ApplicationController
  def show
    @tweet = Tweet.new
    @tweets = current_user.tweets
  end
end
