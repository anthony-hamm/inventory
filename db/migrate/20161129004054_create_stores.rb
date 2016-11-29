class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.integer :administrator_id
      t.integer :clerk_id

      t.timestamps
    end
  end
end
