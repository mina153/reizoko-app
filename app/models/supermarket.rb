class Supermarket < ApplicationRecord
  
  validates :market, presence: true, length: { maximum: 20 }
  validates :detail, length: { maximum: 100}

  belongs_to :user
end
