class Lead < ApplicationRecord
  validates :address, presence: true
end
