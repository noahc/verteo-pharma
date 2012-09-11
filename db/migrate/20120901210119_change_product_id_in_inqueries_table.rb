class ChangeProductIdInInqueriesTable < ActiveRecord::Migration
  def up
    change_column :inqueries, :product_id, :integer
  end

  def down
    change_column :inqueries, :product_id, :string
  end
end
