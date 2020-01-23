class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column(:name, :string)
      t.comumn(:cost, :integer)
      t.column(:country_of_origin. :string)
      t.timestamp()
    end
  end
end
