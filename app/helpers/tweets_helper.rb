module TweetsHelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest(user.email)
    gravatar_url = "//www.gravatar.com/avatar/#{email_digest}"

    image_tag gravatar_url, class: "w-10 h-10 rounded-full mr-4"
  end

  def like_button(tweet)
    if current_user.liked?(tweet)
      link_to "Unlike", unlike_tweet_path(tweet), method: :delete
    else
      link_to "Like", like_tweet_path(tweet), method: :post
    end
  end

  def autolink(body)
    body.gsub(/@\w+/) do |mention|
      link_to mention, user_path(mention[1..-1])
    end.html_safe
  end
end
