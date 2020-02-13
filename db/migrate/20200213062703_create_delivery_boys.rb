class CreateDeliveryBoys < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_boys do |t|
      t.string :name
      t.bigint :phone_number
      t.text :address
      t.string :email
      t.string :password
      t.references :store,null: false, foreign_key: true

      t.timestamps
    end
  end
end
