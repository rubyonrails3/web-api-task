json.(friendship, :id,  :created_at)
json.friend do
  json.(friendship.friend, :id, :name, :email)
end
