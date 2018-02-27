class Sourcing < ApplicationRecord
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
  validates :produit, presence: true
  validates :exigence, presence: true

  after_create :send_sourcing_notification

  private

  def send_sourcing_notification
    SourcingMailer.sourcing_request(self).deliver_now
    SourcingMailer.sourcing_alarm(self).deliver_now
  end
end
