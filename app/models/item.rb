class Item < ApplicationRecord
  belongs_to :user

  validate :thing_presence
  validate :thing_large

  validates :category_id, numericality: { other_than: 1 ,message: "can't be blank"} 

  validate :expiry_presence

  validates :explanation, length: { maximum: 100}
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  

  private

  def thing_presence
    return if thing.present?

    errors.add(:base, "Food can't be blank")
  end

  def thing_large
    return if thing.length<=20
    errors.add(:base, "Food is too long (maximum is 20 characters)")
  end

  def expiry_presence
    return if expiry.present?

    errors.add(:base, "Expiry date can't be blank")
  end
end
