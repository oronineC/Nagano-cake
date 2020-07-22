class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :explanation
      t.integer :price
      t.integer :is_sales_active, default: 1, null: false

      t.timestamps
    end
  end
end
