class ChangeQuestion < ActiveRecord::Migration
  def change
    remove_foreign_key :questions, :users
    add_column :questions, :ticket_id, :integer
  end
end
