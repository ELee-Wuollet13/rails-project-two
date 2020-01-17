class AddRatingToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column(:reviews, :rating, :int)
  end
end
