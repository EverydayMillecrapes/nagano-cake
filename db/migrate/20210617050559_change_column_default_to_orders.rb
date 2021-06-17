class ChangeColumnDefaultToOrders < ActiveRecord::Migration[5.0]
  def change
    change_column_default :orders, :status, from: nil, to: "0"
    change_column_default :orders, :payment_method, from: nil, to: "0"
  end
end
