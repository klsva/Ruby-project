class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :album_name
      t.text :album_description
      t.integer :user_id

      t.timestamps
    end
  end
end
