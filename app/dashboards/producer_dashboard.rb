require "administrate/base_dashboard"

class ProducerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    suppliers: Field::HasMany,
    users: Field::HasMany,
    products: Field::HasMany,
    activities: Field::HasMany,
    categories: Field::HasMany,
    owner: Field::BelongsTo.with_options(class_name: "User"),
    id: Field::Number,
    name: Field::String,
    address: Field::String,
    description: Field::Text,
    first_name: Field::String,
    last_name: Field::String,
    phone_number: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    confirmed: Field::Boolean,
    user_id: Field::Number,

  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :products,
    :categories,
    :confirmed,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :users,
    :products,
    :categories,
    :owner,
    :name,
    :address,
    :description,
    :first_name,
    :last_name,
    :phone_number,
    :created_at,
    :updated_at,
    :confirmed,
    :user_id,
    :photo,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :address,
    :description,
    :first_name,
    :last_name,
    :phone_number,
    :users,
    :photo,
    :categories,
    :confirmed,
    :user_id,
  ].freeze

  # Overwrite this method to customize how producers are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(producer)
    producer.name
  end
end
