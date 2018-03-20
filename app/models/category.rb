class Category < ApplicationRecord

  # RELATIONS
  has_many :activities, dependent: :destroy
  has_many :producers, through: :activities
  has_many :subcategories, dependent: :destroy

  # SCOPES
  scope :cat_name, -> (name) { where name: name }
end
