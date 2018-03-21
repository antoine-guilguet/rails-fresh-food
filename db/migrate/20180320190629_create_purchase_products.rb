class CreatePurchaseProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_products do |t|
      t.references :product, foreign_key: true
      t.references :purchase_list, foreign_key: true

      t.timestamps
    end
  end
end
