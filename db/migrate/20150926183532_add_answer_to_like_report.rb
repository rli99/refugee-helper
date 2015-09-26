class AddAnswerToLikeReport < ActiveRecord::Migration
  def change
    add_foreign_key :likes, :users
    add_foreign_key :likes, :answers
    add_column :likes, :answer_id, :integer
    add_column :likes, :users_id, :integer
    remove_column :reports, :question_id
    remove_foreign_key :reports, :questions
  end
end
