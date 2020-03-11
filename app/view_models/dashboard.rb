class Dashboard
  def initialize(user)
    @user = user
  end

  def timeline
    Timeline.new(timeline_users)
  end

  private

  attr_reader :user

  def timeline_users
    user.followed_users + [user]
  end
end
