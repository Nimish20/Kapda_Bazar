class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email, uniqeness: true
      t.string :password
      t.bigint :number, uniqeness: true
      t.text :address
      t.string :postal_code
      t.string :gender

      t.timestamps
    end
  end
end
