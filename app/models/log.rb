class Log < ApplicationRecord
  mount_uploader :image_name, ImageNameUploader
  
  belongs_to :memory
  
  #ユーザとの紐付け
  validates :memory_id, presence: true
  validates :date, length: { maximum: 50 }
  validates :location, length: { maximum: 50 }
  validates :content,presence: true, length: { maximum: 140 }
  validates :image_name, presence: true
  #validates :title, length: { maximum: 50 }
  
  has_many :relations
  has_many :front, through: :relations, source: :log
end
