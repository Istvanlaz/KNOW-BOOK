class Rating < ApplicationRecord
  belongs_to :book

  validates :rating, inclusion: { in: 0..5 }, numericality: true
end
