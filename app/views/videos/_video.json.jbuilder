json.extract! video, :id, :url, :title, :position, :post_id, :created_at, :updated_at
json.url video_url(video, format: :json)
