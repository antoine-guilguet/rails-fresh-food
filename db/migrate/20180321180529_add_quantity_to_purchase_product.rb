class AddQuantityToPurchaseProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :purchase_products, :quantity, :integer
  end
end
