class AddReportIdToUserAnswerQuestion < ActiveRecord::Migration
  def change
    add_column :users, :report_id, :integer
    add_column :answers, :report_id, :integer
    add_column :questions, :report_id, :integer
  end
end
