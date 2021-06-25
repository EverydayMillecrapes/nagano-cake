class ChangeDataStatusToOrderProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :order_products, :status, :integer
  end
end
