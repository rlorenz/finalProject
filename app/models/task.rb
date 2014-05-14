class Task < ActiveRecord::Base
    belongs_to :a_class
    default_scope -> { order('"dueDate" ASC') }
    validates :a_class_id, presence: true
    validates :name, presence: true, length: { maximum: 50 }
    validates :description, length: { maximum: 50 }
    
    VALID_DATE_REGEX = /\d{4}+[-]+\d{2}+[-]+\d{2}/
    validates :dueDate, format: { with: VALID_DATE_REGEX }
end
