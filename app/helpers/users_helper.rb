module UsersHelper
  def follow_button(user)
    return if current_user == user

    if current_user.following?(user)
      button_to "Unfollow", follow_user_path(user), method: :delete
    else
      button_to "Follow", follow_user_path(user)
    end
  end
end
