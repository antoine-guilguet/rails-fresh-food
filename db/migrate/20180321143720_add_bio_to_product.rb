class AddBioToProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :aop, :boolean
    add_column :products, :bio, :boolean
    add_column :purchase_lists, :recurrence, :boolean, default: false
  end
end
