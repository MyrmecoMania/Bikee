class Rent < ApplicationRecord
  has_many :user
  has_many :bike

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
end
