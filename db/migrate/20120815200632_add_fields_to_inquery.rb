class AddFieldsToInquery < ActiveRecord::Migration
  def change
    add_column :inqueries, :phone, :string
    add_column :inqueries, :street, :string
    add_column :inqueries, :state, :string
    add_column :inqueries, :city, :string
    add_column :inqueries, :zip, :string
  end
end
