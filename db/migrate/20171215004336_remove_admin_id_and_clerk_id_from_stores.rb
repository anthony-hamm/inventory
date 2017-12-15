class RemoveAdminIdAndClerkIdFromStores < ActiveRecord::Migration[5.0]

  def change
    remove_column :stores, :administrator_id
    remove_column :stores, :clerk_id
  end

end
