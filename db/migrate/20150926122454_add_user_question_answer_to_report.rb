class AddUserQuestionAnswerToReport < ActiveRecord::Migration
  def change
    add_foreign_key :reports, :users
    add_foreign_key :reports, :questions
    add_foreign_key :reports, :answers
  end
end
