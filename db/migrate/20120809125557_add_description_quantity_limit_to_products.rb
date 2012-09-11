class AddDescriptionQuantityLimitToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :text
    add_column :products, :stock, :integer
    add_column :products, :limit, :integer
  end
end
