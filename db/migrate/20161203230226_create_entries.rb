class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.integer :store_id
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
