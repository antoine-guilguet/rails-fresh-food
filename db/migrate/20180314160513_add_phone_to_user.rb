class AddPhoneToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :phone_number, :integer
    add_column :users, :phone_number, :string
    remove_column :producers, :phone_number, :integer
    add_column :producers, :phone_number, :string
  end
end
