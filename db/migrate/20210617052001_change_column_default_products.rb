class ChangeColumnDefaultProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_default :products, :is_active, from: nil, to: true
  end
end
