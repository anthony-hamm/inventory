class ChangeCommentsAndRolRows < ActiveRecord::Migration[5.0]

  def change
    change_column :users, :comments, :string
    rename_column :users, :rol, :rol_id
  end

end
