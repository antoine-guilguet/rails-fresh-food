class PurchaseList < ApplicationRecord

  # RELATIONS
  belongs_to :user
  belongs_to :producer
  has_one :schedule
  has_many :purchase_products, dependent: :destroy
  has_many :products, through: :purchase_products
end
