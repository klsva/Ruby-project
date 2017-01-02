class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :photo_name
      t.integer :album_id
      t.text :photo_description
      t.text :file
      t.float :ave_value

      t.timestamps
    end
  end
end
