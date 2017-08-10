class Price < ApplicationRecord
  belongs_to :stock

  validates_uniqueness_of :date, :scope => :stock_id

  validates :date, presence: true
  validates :dailiy_closing_price, presence: true
end
