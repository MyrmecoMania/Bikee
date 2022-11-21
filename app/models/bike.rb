class Bike < ApplicationRecord
  belongs_to :user
  belongs_to :rent

  validates :category, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
end
