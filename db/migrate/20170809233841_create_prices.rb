class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.string :date
      t.string :daily_closing_price
      t.integer :stock_id

      t.timestamps
    end
  end
end
