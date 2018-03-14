class AddNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :restaurant_name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :address, :string
    add_column :users, :siret, :integer
  end
end
