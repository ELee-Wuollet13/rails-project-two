class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.add_column(:name, :string)

      t.timestamp()
    end
  end
end
