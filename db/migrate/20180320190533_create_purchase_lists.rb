class CreatePurchaseLists < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_lists do |t|
      t.references :user, foreign_key: true
      t.references :producer, foreign_key: true
      t.string :name
      t.integer :frequency, default: 0

      t.timestamps
    end
  end
end
