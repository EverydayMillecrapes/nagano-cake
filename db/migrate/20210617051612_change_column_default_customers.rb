class ChangeColumnDefaultCustomers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :customers, :is_deleted, from: nil, to: false
  end
end
