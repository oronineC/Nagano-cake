class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :customer_id
      t.string :street_address
      t.string :postcode
      t.string :address

      t.timestamps
    end
  end
end
