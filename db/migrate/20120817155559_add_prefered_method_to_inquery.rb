class AddPreferedMethodToInquery < ActiveRecord::Migration
  def change
    add_column :inqueries, :perfered_method, :string
  end
end
