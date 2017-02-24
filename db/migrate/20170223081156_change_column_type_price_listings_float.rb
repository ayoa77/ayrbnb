class ChangeColumnTypePriceListingsFloat < ActiveRecord::Migration[5.0]
  def change
  change_column :listings, :price, :float
  end
end
