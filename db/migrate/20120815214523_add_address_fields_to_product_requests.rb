class AddAddressFieldsToProductRequests < ActiveRecord::Migration
  def change
    add_column :product_requests, :street, :string
    add_column :product_requests, :city, :string
    add_column :product_requests, :state, :string
    add_column :product_requests, :zip, :string
  end
end
