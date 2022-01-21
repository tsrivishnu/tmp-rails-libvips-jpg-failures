json.extract! image_file, :id, :name, :image, :created_at, :updated_at
json.url image_file_url(image_file, format: :json)
json.image url_for(image_file.image)
