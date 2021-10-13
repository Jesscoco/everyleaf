json.extract! task, :id, :name, :content, :created_at, :updated_at
json.url task_url(task, format: :json)
