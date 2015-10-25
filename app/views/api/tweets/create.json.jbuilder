json.(tweet, :id, :content)
json.user do
  json.(tweet.user, :id, :name, :email)
end
