class ChangeContentToText < ActiveRecord::Migration
  def change
    change_column :answers, :content, :text
    change_column :questions, :content, :text
  end
end
