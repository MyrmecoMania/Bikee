class Bike < ApplicationRecord
  include BikeConcern

  belongs_to :user
  has_many :rents

  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :category, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
end
