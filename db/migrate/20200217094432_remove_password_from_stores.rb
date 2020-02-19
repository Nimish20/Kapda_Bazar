class RemovePasswordFromStores < ActiveRecord::Migration[6.0]
  def change
  	remove_column :stores, :password, :string
  end
end
