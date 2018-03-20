class Producer < ApplicationRecord

  # RELATIONS
  has_many :suppliers, dependent: :destroy
  has_many :users, through: :suppliers
  has_many :products, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :categories, through: :activities
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  def find_subcategories
    self.products.map{ |product| product.subcategory.name }.uniq
  end

  def render_full_name
    !self.first_name.nil? ? self.first_name.capitalize + " " + self.last_name.capitalize : self.email
  end

  def provides?(user)
    self.users.pluck(:user_id).include?(user.id)
  end
end
