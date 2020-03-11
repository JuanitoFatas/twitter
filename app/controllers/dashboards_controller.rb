class DashboardsController < ApplicationController
  def show
    @tweets = current_user.timeline_tweets
  end
end
