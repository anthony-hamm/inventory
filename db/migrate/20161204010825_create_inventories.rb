class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
    	t.integer :store_id
    	t.integer :item_id
    	t.integer :quantity
    end
  end
end
