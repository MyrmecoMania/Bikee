class Bike < ApplicationRecord
  belongs_to :user
  has_one :rent

  validates :category, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
end
