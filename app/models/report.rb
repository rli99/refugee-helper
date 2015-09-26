class Report < ActiveRecord::Base
    belongs_to :user
    belongs_to :answer
    validates :answer_id, :user_id, uniqueness: true
end