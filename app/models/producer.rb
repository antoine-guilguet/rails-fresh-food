class Producer < ApplicationRecord

  # RELATIONS
  has_many :suppliers, dependent: :destroy
  has_many :users, through: :suppliers
  has_many :products, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :categories, through: :activities
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :purchase_lists
  has_many :schedules

  # VALIDATIONS
  validates :name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :phone_number, presence: true

  def find_subcategories
    self.products.map{ |product| product.subcategory.name }.uniq
  end

  def render_full_name
    if !self.first_name.nil?
      self.first_name + " " + self.last_name
    else
      self.email
    end
  end

  def provides?(user)
    self.users.pluck(:user_id).include?(user.id)
  end

  def get_all_products_registered_with(user)
    products = Array.new
    self.purchase_lists.select { |purchase_list| purchase_list.user_id == user.id }.each do |purchase_list|
      products << purchase_list.products
    end
    return products.first
  end
end
