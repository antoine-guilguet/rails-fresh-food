class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :producer, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
