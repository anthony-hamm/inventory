class ChangeSalePriceDataTypeToInteger < ActiveRecord::Migration[5.0]
  def change
  	change_column :sales, :price, :integer
  end
end
