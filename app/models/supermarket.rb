class Supermarket < ApplicationRecord
  
  validates :market, length: { maximum: 20 }
  validate :market_presence

  validates :detail, length: { maximum: 100}

  belongs_to :user
  has_many :wants


  private

  def market_presence
    return if market.present?

    errors.add(:base, "Supermarket name can't be blank")
  end


end
