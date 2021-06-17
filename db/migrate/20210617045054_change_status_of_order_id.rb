class ChangeStatusOfOrderId < ActiveRecord::Migration[5.0]
  def up
   change_column :order_products, :status, :string, default:0
  end
  
  def down
   change_column :order_products, :status, :string
  end
end
