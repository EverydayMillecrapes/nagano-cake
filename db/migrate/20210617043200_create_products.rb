class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :name
      t.integer :non_tax_price
      t.text :introduction
      t.boolean :is_active

      t.timestamps
    end
  end
end
