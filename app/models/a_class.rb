class AClass < ActiveRecord::Base
    belongs_to :user
    
    validates :name, presence: true, length: { maximum: 40 }
    validates :user_id, presence: true
    
end
