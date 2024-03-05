json.extract! source, :id, :url, :title, :position, :post_id, :created_at, :updated_at
json.url source_url(source, format: :json)
