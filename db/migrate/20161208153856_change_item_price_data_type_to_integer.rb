class ChangeItemPriceDataTypeToInteger < ActiveRecord::Migration[5.0]
  def change
  	change_column :items, :sale_price, :integer
  end
end
