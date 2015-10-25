json.friends friends do |friend|
  json.(friend, :id, :name, :email, :created_at)
end
