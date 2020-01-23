class Products < ApplicationRecord
  has_many :costs
  has_many :reviews
  has_many :reviews, dependent: :destroy
  has_many :country_of_origin
end
