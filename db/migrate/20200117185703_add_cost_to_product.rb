class AddCostToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column(:products, :cost, :int)
  end
end
