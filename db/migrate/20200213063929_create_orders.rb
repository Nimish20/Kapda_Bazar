class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.money :total_amount
      t.money :total_rent
      t.money :refund_amount
      t.string :status
      t.string :payment_mode
      t.string :payment_status
      t.date :order_date
      t.daterange :time_period
      t.references :customer, null: false, foreign_key: true
      t.references :delivery_boy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
