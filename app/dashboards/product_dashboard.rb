require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    producer: Field::BelongsTo,
    subcategory: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    conditionning: Field::String,
    price: Field::Number.with_options(decimals: 2),
    description: Field::Text,
    label: Field::String,
    origin: Field::String,
    aop: Field::Boolean,
    composition: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    quantity: Field::String,
    unit: Field::String,
    stock: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :subcategory,
    :producer,
    :stock,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :producer,
    :subcategory,
    :conditionning,
    :price,
    :description,
    :label,
    :origin,
    :aop,
    :composition,
    :created_at,
    :updated_at,
    :quantity,
    :unit,
    :stock,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :producer,
    :subcategory,
    :name,
    :conditionning,
    :price,
    :description,
    :label,
    :origin,
    :aop,
    :composition,
    :quantity,
    :unit,
    :stock,
  ].freeze

  def display_resource(product)
    "#{product.name} de #{product.producer.name}"
  end
end
