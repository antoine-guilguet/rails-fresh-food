class Supplier < ApplicationRecord

  # RELATIONS
  belongs_to :user
  belongs_to :producer
end
