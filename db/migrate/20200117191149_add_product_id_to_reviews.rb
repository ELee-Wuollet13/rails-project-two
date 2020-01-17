class AddProductIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column(:review_id, :integer)
  end
end
