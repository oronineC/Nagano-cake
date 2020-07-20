class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.boolean :is_sales_active
      t.string :image_id
      t.text :explanation
      t.integer :price

      t.timestamps
    end
  end
end
