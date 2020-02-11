
Product.destroy_all
Review.destroy_all

50.times do |index|
  @product = Product.create!(name: Faker::Device.model_name, cost: Faker::Alphanumeric.alphanumeric(number: 3, min_numeric: 3), country: Faker::Address.country)
  5.times do |nested_index|
    Review.create!(author: Faker::Name.name, rating: Faker::Number.between(from: 1, to: 5), content: Faker::Lorem.sentence(word_count: 20), product_id: @product.id)
  end
end
p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
