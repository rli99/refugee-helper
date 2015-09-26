class AddReportLikeToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :like, :integer
    add_column :answers, :report, :integer
  end
end
