class CreateSourcings < ActiveRecord::Migration[5.1]
  def change
    create_table :sourcings do |t|
      t.string :produit
      t.string :exigence
      t.string :email

      t.timestamps
    end
  end
end
