json.extract! user, :id, :email, :user, :pass, :created_at, :updated_at
json.url user_url(user, format: :json)