class PurchaseProduct < ApplicationRecord

  # RELATIONS
  belongs_to :product
  belongs_to :purchase_list

  # VALIDATIONS
  validates :quantity, presence: true, numericality: true

  def compute_weight_in_kg
    product = self.product
    product.convert_quantity_in_kg * self.quantity
  end

  def compute_total_price_and_currency
    product = self.product
    "#{product.price * self.quantity}€"
  end

  def compute_total_price
    product = self.product
    product.price * self.quantity
  end
end
