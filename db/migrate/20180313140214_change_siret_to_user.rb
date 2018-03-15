class ChangeSiretToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :siret, :integer
    add_column :users, :siret, :float
  end
end
