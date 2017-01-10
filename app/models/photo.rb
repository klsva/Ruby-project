class Photo < ApplicationRecord
  belongs_to :album
  validates :photo_name, presence: true
  mount_uploader :photo_name, PhotoUploader
end
