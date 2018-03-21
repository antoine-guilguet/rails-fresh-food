class PurchaseProduct < ApplicationRecord

  # RELATIONS
  belongs_to :product
  belongs_to :purchase_list

  def compute_total_weight(product)
    "#{product.quantity * self.quantity} #{product.unit}"
  end

  def compute_total_price(product)
    "#{product.price * self.quantity}€"
  end
end
