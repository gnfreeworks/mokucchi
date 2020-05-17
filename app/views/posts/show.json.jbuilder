json.post @post, :id, :title, :description, :access_url, :created_at, :updated_at
json.comments @comments, :id, :comment, :created_at, :name