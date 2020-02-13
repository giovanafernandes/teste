json.extract! weather, :id, :type, :impracticable, :created_at, :updated_at
json.url weather_url(weather, format: :json)
