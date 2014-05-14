class AClass < ActiveRecord::Base
    belongs_to :user
    has_many :tasks, dependent: :destroy
    
    validates :name, presence: true, length: { maximum: 40 }
    validates :user_id, presence: true
    
end
