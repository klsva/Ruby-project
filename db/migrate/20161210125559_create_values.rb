class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.integer :user_id
      t.integer :image_id
      t.string :value
      t.string :integer

      t.timestamps
    end
  end
end
