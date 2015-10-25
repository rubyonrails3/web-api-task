json.feeds tweets do |tweet|
  json.(tweet, :id, :content, :created_at, :user_id)
  json.user(tweet.user, :id, :name, :email)
  json.is_owner tweet.user_id == current_user.id
end
