class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :postcode
      t.string :address
      t.integer :postage
      t.integer :total_amount
      t.integer :payment_method
      t.integer :status

      t.timestamps
    end
  end
end
