class Sourcing < ApplicationRecord
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
  validates :produit, presence: true
  validates :exigence, presence: true
end
