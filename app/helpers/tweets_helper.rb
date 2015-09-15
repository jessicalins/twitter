module TweetsHelper
  def tweet_mention(tweet)
    if tweet.content.match(/(@\w+)/)
      tweet.content.gsub(/@(\w+)/) do |username| 
        link_to(username, user_path("#{$1}".tr('@',''))) 
      end
    else
      tweet.content 
    end 
  end

  def delete_tweet(tweet)
    if current_user.tweets.exists?(tweet) 
      link_to "Delete", tweet, remote: true, method: :delete, data: { confirm: 'Are you sure you want to delete this Tweet?' }
    end 
  end
end
