class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content, presence: true
  validates_length_of :content, minimum: 50, maximum: 250
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6}
  scope :most_popular, -> { group(:product_id).count.sort_by(&:size) }



  def self.most_popular
    group(:product_id).count.sort_by(&:size)

  end

end
