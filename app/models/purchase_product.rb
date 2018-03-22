class PurchaseProduct < ApplicationRecord

  # RELATIONS
  belongs_to :product
  belongs_to :purchase_list

  # VALIDATIONS
  validates :quantity, presence: true, numericality: true

  def compute_total_weight(product)
    return "#{ product.quantity * self.quantity } #{product.unit}"
  end

  def compute_total_price(product)
    "#{product.price * self.quantity}€"
  end
end
