class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.string :address
      t.string :street_number
      t.string :route
      t.string :locality
      t.string :country

      t.timestamps
    end
  end
end
