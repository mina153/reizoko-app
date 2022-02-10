class Item < ApplicationRecord
  belongs_to :user

  validate :thing_presence
  validates :thing,  length: { maximum: 20 }

  validates :category_id, numericality: { other_than: 1 ,message: " can't be blank"} 

  validate :expiry_presence

  validates :explanation, length: { maximum: 100}
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  

  private

  def thing_presence
    return if thing.present?

    errors.add(:base, "Food can't be blank")
  end


  def expiry_presence
    return if expiry.present?

    errors.add(:base, "Expiry date can't be blank")
  end
end
