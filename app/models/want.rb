class Want < ApplicationRecord
 
  validate :wanted_presence

  # validates :categori_id, numericality: { other_than: 1 } 
  validate :categori_presence

  validates :account, length: { maximum: 100}

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :categori

  belongs_to :user
  belongs_to :supermarket
  

  private

  def wanted_presence
    return if wanted.present?

    errors.add(:base, "Food can't be blank")
  end


  def categori_presence
    return if categori_id != 1

    errors.add(:base, "Category can't be blank")
  end


end
