class CreateProducers < ActiveRecord::Migration[5.1]
  def change
    create_table :producers do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :first_name
      t.string :last_name
      t.integer :phone_number
      t.string :category

      t.timestamps
    end
  end
end
