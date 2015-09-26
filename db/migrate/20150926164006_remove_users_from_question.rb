class RemoveUsersFromQuestion < ActiveRecord::Migration
  def change
    remove_foreign_key :questions, :users
  end
end
