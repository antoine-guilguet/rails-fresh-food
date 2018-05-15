class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # RELATIONS
  has_many :suppliers, dependent: :destroy
  has_many :producers, through: :suppliers
  has_many :my_producers, class_name: "Producer"
  has_many :purchase_lists, dependent: :destroy

  # VALIDATIONS
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
  validates :phone_number, presence: true
  validates :siret, presence: true
  validates :restaurant_name, presence: true

  def render_initials
    !self.first_name.nil? ? self.first_name.upcase.first + self.last_name.upcase.first : ""
  end

  def render_full_name
    !self.first_name.nil? ? self.first_name + " " + self.last_name : self.email
  end

  def get_all_products
    products = Array.new
    self.purchase_lists.each do |purchase_list|
      purchase_list.products.each do |product|
        products << product
      end
    end
    return products.uniq { |product| product.id }
  end

  def get_products_hash_sort_by_producer
    hash = Hash.new
    self.purchase_lists.each do |purchase_list|
      hash[purchase_list.producer.name] = purchase_list.products
    end
    return hash
  end

end
