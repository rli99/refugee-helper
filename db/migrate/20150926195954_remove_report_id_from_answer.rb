class RemoveReportIdFromAnswer < ActiveRecord::Migration
  def change
    remove_column :questions, :report_id
  end
end
