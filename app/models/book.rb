class Book < ApplicationRecord
  has_many :users
  has_many :ratings, dependent: :destroy
  validates :title, presence: true
  validates :author, presence: true
  validates :publishing_year, presence: true

  def average_rating
    (ratings.map(&:rating).sum / ratings.count).round 2
  end
end
