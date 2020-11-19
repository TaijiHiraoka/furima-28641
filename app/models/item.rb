class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :send_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :send_day
  
  has_one_attached :image
  
  belongs_to       :user
  has_one          :buy_controls
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "isn't Half-width number" }
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of range (¥300~9,999,999)"}
  end
  
  with_options numericality: {other_than: 1, message: "dosen't selected" } do
    validates :category_id
    validates :condition_id
    validates :send_cost_id
    validates :prefecture_id
    validates :send_day_id
  end
end
