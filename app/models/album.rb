class Album < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)} #задает порядок показа альбомов
  validates :user_id, presence: true #проверка user_id в album
  validates :album_name, presence: true, length: {maximum: 100}
  validates :album_description, presence: true, length: {maximum: 200}

end
