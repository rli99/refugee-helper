class RemoveIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :question_id, :integer
    remove_column :users, :answer_id, :integer
    remove_column :users, :report_id, :integer
    remove_column :questions, :user_id, :integer
    remove_column :questions, :answer_id, :integer
    remove_column :questions, :report_id, :integer
  end
end
