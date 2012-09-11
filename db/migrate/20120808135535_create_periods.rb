class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :name
      t.time :time
      t.integer :event_id

      t.timestamps
    end
  end
end
