class AddStatusToSamplesRequest < ActiveRecord::Migration
  def change
    add_column :product_requests, :status, :string, default: 'new'
  end
end
