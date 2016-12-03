class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :store_id
      t.integer :item_id
      t.integer :quantity
      t.decimal :sale_price

      t.timestamps
    end
  end
end
