class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.references :purchase_list, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :delivered, default: false
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
