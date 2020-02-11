class Review < ApplicationRecord
  belongs_to :product, dependent: :destroy

  validates :author, presence: true
  validates :content, presence: true
  validates_length_of :content, minimum: 50, maximum: 250
  validates :rating, presence: true

end
