class AddUserAndQuestionToAnswer < ActiveRecord::Migration
  def change
    add_foreign_key :answers, :users
    add_foreign_key :answers, :questions
  end
end
