json.extract! company, :id, :name, :cnpj, :business_name, :rg, :neighborhood, :street, :number, :state, :city, :zip_code, :state_registration, :created_at, :updated_at, :membership_id
json.url company_url(company, format: :json)
