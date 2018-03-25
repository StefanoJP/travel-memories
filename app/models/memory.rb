class Memory < ApplicationRecord
  belongs_to :user
  
  #ユーザとの紐付け
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50}
  validates :date, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 50 }

  #validates :image_name, presence: true
  #validates :content, length: { maximum: 255 }
  
  has_many :logs, dependent: :destroy
  has_many :relations
  has_many :details, through: :relations, source: :memory
end
