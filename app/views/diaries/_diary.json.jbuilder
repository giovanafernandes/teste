json.extract! diary, :id, :hr_observation, :third_observation, :observation, :start, :end, :work_id, :weather_id, :created_at, :updated_at
json.url diary_url(diary, format: :json)
