class RenameProductToProductIdOnInqueriesTable < ActiveRecord::Migration
  def up
    rename_column :inqueries, :product, :product_id
  end

  def down
    rename_column :inqueries, :product_id, :product
  end
end
