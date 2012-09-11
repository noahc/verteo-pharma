class AddDescriptionToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :description, :text
  end
end
