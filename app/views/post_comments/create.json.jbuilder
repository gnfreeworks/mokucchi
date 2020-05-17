json.comment @comment, :id, :comment, :created_at

user_name = {name: @user_name}
json.comment do
  json.merge! user_name
end
