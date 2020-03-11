module TweetsHelper
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

  def tweet_form_for(content_type)
    form_for Tweet.new, html: { class: "bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4" } do |form|
      form.hidden_field(:content_type, value: content_type) +
      tag.div(class: "mb-6") do
        form.fields_for(:content) do |content_form|
          yield(content_form)
        end
      end +
      tag.div(class: "text-right") do
        form.submit "Tweet", class: "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
      end
    end
  end
end
