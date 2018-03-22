class ChangeQuantityToProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :quantity, :string
    add_column :products, :quantity, :integer, default: 1
  end
end
