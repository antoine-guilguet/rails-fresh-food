class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :producer
      t.string :origin
      t.integer :rating
      t.integer :quantity
      t.string :measure
      t.string :category

      t.timestamps
    end
  end
end
