class Like <ActiveRecord::Base
   belongs_to :answer 
   belongs_to :user
   validates :answer_id, :user_id, uniqueness: true
end