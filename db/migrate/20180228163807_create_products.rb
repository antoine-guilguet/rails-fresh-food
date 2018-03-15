class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :conditionning
      t.float :price
      t.text :description
      t.string :label
      t.float :price_per_kg
      t.string :origin
      t.boolean :aop
      t.text :composition
      t.references :producer, foreign_key: true

      t.timestamps
    end
  end
end
