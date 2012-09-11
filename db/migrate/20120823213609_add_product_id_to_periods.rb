class AddProductIdToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :product_id, :integer
  end
end
