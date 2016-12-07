class CreateStock < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :store_id
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
