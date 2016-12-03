class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :administrator_id
      t.string :clerk_id

      t.timestamps
    end
  end
end
