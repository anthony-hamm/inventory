class AddUsernameToUserTable < ActiveRecord::Migration[5.0]

  def change
    add_column :users, :username, :string, :limit => 20
  end

end
