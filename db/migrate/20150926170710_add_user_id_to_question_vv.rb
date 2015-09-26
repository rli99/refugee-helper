class AddUserIdToQuestionVv < ActiveRecord::Migration
  def change
    add_column :users, :question_id, :integer
    add_column :questions, :user_id, :integer
  end
end
