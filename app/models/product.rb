class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates_length_of :name, maximum: 100
  validates :cost, presence: true
  validates :country, presence: true

  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country, count(reviews.id) as review_count")
    .joins(:reviews)
    .group("products.id")
    .order("review_count DESC")
    .limit(1)
    )}
    scope :three_recent, -> {order(created_at: :desc).limit(3)}
    scope :america_made, -> {where("country = 'United States'")}


    before_save(:titleize_product)
    private
     def titleize_product
       self.name = self.name.try(:titleize)
     end

  end
