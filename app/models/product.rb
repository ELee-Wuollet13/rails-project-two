class Product < ApplicationRecord
  has_many :reviews
  has_many :reviews, dependent: :destroy
end
