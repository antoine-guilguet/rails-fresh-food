class Schedule < ApplicationRecord

  # RELATIONS
  belongs_to :purchase_list
  belongs_to :user
  has_many :weeks

  # VALIDATIONS

end
