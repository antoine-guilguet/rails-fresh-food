class Producer < ApplicationRecord

  # RELATIONS
  has_many :products, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :categories, through: :activities
end
