class Photo < ApplicationRecord
  belongs_to :album
  mount_uploader :file, PhotoUploader
end
