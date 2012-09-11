class AddStartTimeAndEndTimeToPeriod < ActiveRecord::Migration
  def change
    add_column :periods, :start_time, :time
    add_column :periods, :end_time, :time
    remove_column :periods, :time

  end
end
