class CreateWeeks < ActiveRecord::Migration[5.1]
  def change
    create_table :weeks do |t|
      t.string :name
      t.references :schedule, foreign_key: true
      t.boolean :past, default: false
      t.boolean :begin_cycle, default: false

      t.timestamps
    end
  end
end
