class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :method_of_payment
      t.integer :order_status, default: 0
      t.integer :total_fee
      t.integer :postage, default: 800
      t.string :delivery_street_address
      t.string :delivery_address
      t.string :delivery_post_code

      t.timestamps
    end
  end
end
