class Reviews < ApplicationRecord
  belongs_to :product
  has_many :authors
  has_many :content_body
  has_many :foreign_key
end
