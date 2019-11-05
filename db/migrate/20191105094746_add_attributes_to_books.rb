class AddAttributesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :publishing_year, :integer
    add_column :books, :rating, :float
  end
end
