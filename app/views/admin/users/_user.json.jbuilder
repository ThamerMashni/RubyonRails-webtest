json.extract! user, :id, :name, :email, :created_at, :updated_at, :gender, :cvFile
json.url user_url(user, format: :json)
