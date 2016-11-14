json.extract! website, :id, :url, :status, :lastchecked, :created_at, :updated_at
json.url website_url(website, format: :json)