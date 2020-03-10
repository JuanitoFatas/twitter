module TweetsHelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest(user.email)
    gravatar_url = "//www.gravatar.com/avatar/#{email_digest}"

    image_tag gravatar_url, class: "w-10 h-10 rounded-full mr-4"
  end
end
