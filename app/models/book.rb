class Book < ApplicationRecord
  has_many :users
  has_many :ratings, dependent: :destroy
  has_one_attached :resume


  validates :title, presence: true
  validates :author, presence: true
  validates :publishing_year, presence: true

  def average_rating
    return 0 if ratings.empty?

    (ratings.map(&:rating).sum / ratings.count).round 2
  end
end
