class Producer < ApplicationRecord

  # RELATIONS
  has_many :suppliers, dependent: :destroy
  has_many :users, through: :suppliers
  has_many :products, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :categories, through: :activities
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  mount_uploader :photo, PhotoUploader

  def find_subcategories
    self.products.map{ |product| product.subcategory.name }.uniq
  end

end
