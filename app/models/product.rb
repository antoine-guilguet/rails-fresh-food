class Product < ApplicationRecord

  # RELATIONS
  belongs_to :producer
  belongs_to :subcategory

  mount_uploader :photo, PhotoUploader

end
