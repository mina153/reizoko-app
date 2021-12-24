class Want < ApplicationRecord
  belongs_to :user
  belongs_to :supermarket

  validates :wanted, presence: true
  validates :categori_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :account, length: { maximum: 100}

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :categori
end
