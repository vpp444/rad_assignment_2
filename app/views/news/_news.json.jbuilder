

json.user do |json|
 json.(@news.user, :id, :name)
 json.extract! news, :title,:url, :created_at
end