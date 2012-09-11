class CreateProductRequests < ActiveRecord::Migration
  def change
    create_table :product_requests do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
