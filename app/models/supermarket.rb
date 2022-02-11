class Supermarket < ApplicationRecord
  
  validate :market_large 
  validate :market_presence

  validates :detail, length: { maximum: 100}

  belongs_to :user
  has_many :wants


  private

  def market_presence
    return if market.present?
    errors.add(:base, "Supermarket name can't be blank")
  end

  def market_large
    return if market.length<=20
    errors.add(:base, "Supermarket name is too long (maximum is 20 characters)")
  end
end
