require 'faker'

10.times do
  Product.create! do |product|
    product.name = Faker::Device.model_name,
    product.cost =  Faker::Alphanumeric.alphanumeric(number: 3, min_numeric: 3),
    product.country = Faker::Address.country
    5.times do
      product.review.new do |review|
        review.author = Faker::Name.name,
        review.content =
        Faker::Lorem.sentence(word_count: 20),
        review.rating = Faker::Alphanumeric.alphanumeric(number: 1, min_numeric: 1)
        review.product_id = Faker::Number.within(range: 1..50)
      end
    end
  end
end
