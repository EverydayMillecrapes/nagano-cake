class AddOrderidToOrderProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :order_products, :order_id, :integer 
    add_column :order_products, :product_id, :integer
  end
end
