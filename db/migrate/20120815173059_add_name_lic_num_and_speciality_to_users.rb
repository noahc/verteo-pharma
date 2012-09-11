class AddNameLicNumAndSpecialityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :license_number, :string
    add_column :users, :state, :string
    add_column :users, :specialty, :string
  end
end
