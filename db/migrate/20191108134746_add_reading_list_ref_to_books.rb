class AddReadingListRefToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :reading_list, foreign_key: true
  end
end
