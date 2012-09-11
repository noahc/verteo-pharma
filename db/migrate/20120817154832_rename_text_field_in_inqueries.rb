class RenameTextFieldInInqueries < ActiveRecord::Migration
  def change
    rename_column :inqueries, :text, :description
    add_column :inqueries, :user_id, :integer
  end

  
end
