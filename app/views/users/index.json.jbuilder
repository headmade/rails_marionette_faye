json.array!(@users) do |user|
  json.extract! user, :name, :status, :task_id
  json.url user_url(user, format: :json)
end
