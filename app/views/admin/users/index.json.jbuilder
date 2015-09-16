json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :password, :email, :password_key
  json.url user_url(user, format: :json)
end
