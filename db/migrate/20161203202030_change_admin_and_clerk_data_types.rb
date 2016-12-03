class ChangeAdminAndClerkDataTypes < ActiveRecord::Migration[5.0]
  def change
  	change_column :stores, :administrator_id, :string
  	change_column :stores, :clerk_id, :string
  end
end
