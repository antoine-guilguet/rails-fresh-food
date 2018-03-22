class Product < ApplicationRecord

  # RELATIONS
  belongs_to :producer
  belongs_to :subcategory
  has_many :purchase_products
  has_many :purchase_lists, through: :purchase_products

  # VALIDATIONS
  validates :price, presence: true
  validates :quantity, presence: true
  validates :unit, presence: true

  def compute_price_per_kg
    unit = self.unit
    quantity = self.quantity.to_f
    price = self.price.to_f

    if unit ==  "g"
      return "#{ (price / quantity * 1000 ).round(1)} €/ kg"
    elsif unit == "kg"
      return "#{(( 1 / quantity ) * price ).round(1)} €/ kg"
    else
      self.original_price
    end
  end

  def original_price
    "#{self.price.round(1) }€ / #{self.quantity} #{self.unit}"
  end

  def price_with_currency
    "#{self.price} €"
  end

  def convert_quantity_in_kg
    if self.unit.strip == "g"
      self.quantity.to_f / 1000
    elsif self.unit.strip == "kg"
      self.quantity
    end
  end
end
