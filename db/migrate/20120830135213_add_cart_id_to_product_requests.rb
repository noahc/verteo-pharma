class AddCartIdToProductRequests < ActiveRecord::Migration
  def change
    add_column :product_requests, :cart_id, :integer
  end
end
