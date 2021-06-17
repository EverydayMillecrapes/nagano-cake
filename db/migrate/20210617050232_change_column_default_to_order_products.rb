class ChangeColumnDefaultToOrderProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_default :order_products, :status, from: nil, to: "0"
  end
end
