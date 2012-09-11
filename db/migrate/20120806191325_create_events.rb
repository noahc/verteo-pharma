class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :street
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
