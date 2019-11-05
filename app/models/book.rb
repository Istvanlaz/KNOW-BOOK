class Book < ApplicationRecord
  has_many :users

  validates :title, presence: true
  validates :author, presence: true
  validates :publishing_year, presence: true
  validates :rating, inclusion: { in: 0..5 }, numericality: true
end
