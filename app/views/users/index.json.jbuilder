json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :date_of_birth, :gender, :prof_pic
  json.url user_url(user, format: :json)
end
