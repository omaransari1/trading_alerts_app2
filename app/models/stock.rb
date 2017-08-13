class Stock < ApplicationRecord
  has_many :prices

  validates :symbol, presence: true
  validates :company, presence: true
end
