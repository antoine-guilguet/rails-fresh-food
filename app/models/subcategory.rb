class Subcategory < ApplicationRecord

  # RELATIONS
  belongs_to :category
  has_many :products
end
