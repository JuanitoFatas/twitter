module UsersHelper
  def follow_button(user)
    return if current_user == user

    if current_user.following?(user)
      button_to "Unfollow", follow_user_path(user), method: :delete, class: "ml-2 bg-transparent hover:bg-blue-700 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded-full"
    else
      button_to "Follow", follow_user_path(user), class: "ml-2 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-full"
    end
  end
end
