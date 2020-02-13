json.extract! user, :id, :name, :email, :password_digest, :user_type_id, :access_id, :branch_references, :created_at, :updated_at
json.url user_url(user, format: :json)
