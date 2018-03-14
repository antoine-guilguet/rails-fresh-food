class AddConfirmatioToProducer < ActiveRecord::Migration[5.1]
  def change
    add_column :producers, :confirmed, :boolean, default: false
    add_column :producers, :user_id, :integer
  end
end
