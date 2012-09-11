class CreateInqueries < ActiveRecord::Migration
  def change
    create_table :inqueries do |t|
      t.string :product
      t.text :text

      t.timestamps
    end
  end
end
