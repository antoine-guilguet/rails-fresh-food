class SourcingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sourcing_mailer.sourcing_request.subject
  #

  def sourcing_request(sourcing)
    @sourcing = sourcing
    mail( :to => @sourcing.email,
          :subject => 'Nous avons bien reçu votre demande de sourcing, merci pour votre confiance' )
  end
end
