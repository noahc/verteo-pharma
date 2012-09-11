class CreatePeriodRegistration < ActiveRecord::Migration
   def change
    create_table :period_registrations do |t|
      t.integer :period_id
      t.integer :user_id

      t.timestamps
    end
  end
end
