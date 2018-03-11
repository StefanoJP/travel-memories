class Memory < ApplicationRecord
  belongs_to :user
  
  #ユーザとの紐付け
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :date, presence: true, length: { maximum: 50 }
  validates :location, presence: true, length: { maximum: 50 }
  #空の場合の設定行う
  validates :image_name, length: { maximum: 255 }
  #不要
  validates :content, length: { maximum: 255 }
end
