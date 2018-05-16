class PurchaseList < ApplicationRecord

  # RELATIONS
  belongs_to :user
  belongs_to :producer
  has_one :schedule
  has_many :purchase_products, dependent: :destroy
  has_many :products, through: :purchase_products

  # VALIDATIONS
  validates :name, presence: true
  validates :frequency, presence: true, numericality: true

  def compute_total_expense
    purchase_products = self.purchase_products
    sum = 0
    purchase_products.each do |purchase_product|
      sum += purchase_product.compute_total_price
    end
    return sum
  end

  def compute_total_items
    purchase_products = self.purchase_products
    sum = 0
    purchase_products.each do |purchase_product|
      sum += purchase_product.quantity
    end
    return sum
  end

  def compute_total_weight
    purchase_products = self.purchase_products
    sum = 0
    purchase_products.each do |purchase_product|
      sum += purchase_product.compute_weight_in_kg
    end
    return sum.round(1)
  end
end
