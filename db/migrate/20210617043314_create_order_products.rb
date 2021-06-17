class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.integer :amount
      t.integer :status
      t.integer :tax_price

      t.timestamps
    end
  end
end
