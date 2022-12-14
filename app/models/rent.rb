class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end
