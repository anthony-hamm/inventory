class RenameInventoriesToStocks < ActiveRecord::Migration[5.0]
  def change
    rename_table :inventories, :stocks
  end 
end