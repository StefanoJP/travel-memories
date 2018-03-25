class Relation < ApplicationRecord
  belongs_to :memory
  belongs_to :log
  
  validates :memory_id, presence: true
  validates :log_id,presence: true
  
end
