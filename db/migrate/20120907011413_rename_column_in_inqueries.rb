class RenameColumnInInqueries < ActiveRecord::Migration
   def change
    rename_column :inqueries, :description, :message
  end

end
