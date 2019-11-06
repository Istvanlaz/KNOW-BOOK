class AddRatingtoRatings < ActiveRecord::Migration[5.2]
  def change
    add_reference :ratings, :book, foreign_key: true
    add_column :ratings, :rating, :float
  end
end
