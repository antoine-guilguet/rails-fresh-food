class Product < ApplicationRecord

  # RELATIONS
  belongs_to :producer
  belongs_to :subcategory

  # VALIDATIONS
  validates :price, presence: true
  validates :quantity, presence: true
  validates :unit, presence: true

  def compute_price_per_kg
    unit = self.unit
    quantity = self.quantity.to_f
    price = self.price.to_f

    if unit ==  "g"
      return "#{ (price / quantity * 1000 ).round(1)} / kg"
    elsif unit == "kg"
      return "#{(( 1 / quantity ) * price ).round(1)} / kg"
    else
      self.original_price
    end
  end

  def original_price
    "#{self.price.round } / #{self.quantity} #{self.unit}"
  end

  def price_with_currency
    "#{self.price} €"
  end

end
