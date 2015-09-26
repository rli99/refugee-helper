class AddUserAnswerQuestionIdToReport < ActiveRecord::Migration
  def change
    add_column :reports, :user_id, :integer
    add_column :reports, :answer_id, :integer
    add_column :reports, :question_id, :integer
  end
end
