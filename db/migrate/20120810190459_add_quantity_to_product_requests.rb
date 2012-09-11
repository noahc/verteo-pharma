class AddQuantityToProductRequests < ActiveRecord::Migration
  def change
    add_column :product_requests, :quantity, :integer
  end
end
