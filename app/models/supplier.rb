class Supplier < ApplicationRecord

  # RELATIONS
  belongs_to :user
  belongs_to :producer

  # VALIDATIONS
  validates :user_id, uniqueness: { scope: :producer_id }
end
