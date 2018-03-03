class AddUnityToProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :price_per_kg, :float
    add_column :products, :quantity, :string
    add_column :products, :unity, :string, default: "g"
  end
end
