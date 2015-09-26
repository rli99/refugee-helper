class ChangeQuestionTicketId < ActiveRecord::Migration
  def change
    change_column :questions, :ticket_id, :string
  end
end
