json.extract! photo, :id, :photo_name, :album_id, :photo_description, :file, :ave_value, :created_at, :updated_at
json.url photo_url(photo, format: :json)