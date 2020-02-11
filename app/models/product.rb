class Product < ApplicationRecord
  has_many :review, dependent: :destroy

  scope :american, -> { where(country: "United States || USA || America")}
  # scope :newest, -> { where("created_at >=?": Time.)}
  scope :most_reviewed, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(3)
    )}


    validates :name, presence: true
    validates_length_of :name, maximum: 100
    validates :cost, presence: true
    validates :country, presence: true

    before_save(:titleize_product)
    private
    def titleize_product
      self.name = self.name.try(:titleize)

    end
  end
