class Item < ApplicationRecord

belongs_to :user

validates :thing, presence: true, length: { maximum: 20 }
validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
validates :expiry, presence: true
validates :explanation, length: { maximum: 100}

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
