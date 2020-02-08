class Product < ApplicationRecord
  has_many :review


  # before_save(:titleize_project)
  #
  # private
  # def titleize_project
  #   # self.name = self.name.titleize
  #
  #   self.name = self.name.try(:titleize)
  #
  #
  # end
end
