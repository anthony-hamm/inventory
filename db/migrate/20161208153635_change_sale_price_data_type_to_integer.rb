class ChangeSalePriceDataTypeToInteger < ActiveRecord::Migration[5.0]
  def change
  	change_column :sales, :sale_price, :integer
  end
end
