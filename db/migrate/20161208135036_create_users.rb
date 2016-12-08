class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :phone
      t.string :email
      t.integer :comments
      t.string :password
      t.integer :rol

      t.timestamps
    end
  end
end
