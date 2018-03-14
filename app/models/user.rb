class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # RELATIONS
  has_many :suppliers
  has_many :producers, through: :suppliers
  has_many :my_producers, class_name: "Producer"

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
    !self.first_name.nil? ? self.first_name.capitalize + " " + self.last_name.capitalize : self.email
  end

end
