class Book < ApplicationRecord
  has_many :users
  has_one_attached :resume

  validates :title, presence: true
  validates :author, presence: true
  validates :publishing_year, presence: true
  validates :rating, inclusion: { in: 0..5 }, numericality: true
end
