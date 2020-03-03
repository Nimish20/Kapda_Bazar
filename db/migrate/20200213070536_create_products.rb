class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.string :size
      t.boolean :availability, default: true
      t.money :price
      t.money :rent_cost
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
