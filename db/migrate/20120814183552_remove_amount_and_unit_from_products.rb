class RemoveAmountAndUnitFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :unit
    remove_column :products, :amount
  end

  def down
    add_column :products, :unit
    add_column :products, :amount
  end
end
