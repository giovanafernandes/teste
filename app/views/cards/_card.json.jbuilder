json.extract! card, :id, :name, :cpf, :number, :validate, :security_code, :created_at, :updated_at
json.url card_url(card, format: :json)
