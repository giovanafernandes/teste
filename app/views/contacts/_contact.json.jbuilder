json.extract! contact, :id, :phone, :email, :company_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
