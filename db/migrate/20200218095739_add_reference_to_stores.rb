class AddReferenceToStores < ActiveRecord::Migration[6.0]
  def change
    add_reference :stores, :seller, foreign_key: true
  end
end
