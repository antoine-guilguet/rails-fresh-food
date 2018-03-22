class AddDateToPurchaseList < ActiveRecord::Migration[5.1]
  def change
    add_column :purchase_lists, :delivery_date, :datetime
  end
end
