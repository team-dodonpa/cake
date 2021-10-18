class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.integer :price
      t.string :name
      t.boolean :is_active
      t.string :image_id
      t.text :introduction
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
