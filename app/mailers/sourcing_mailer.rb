class SourcingMailer < ApplicationMailer

  def sourcing_request(sourcing)
    @sourcing = sourcing
    mail( :to => @sourcing.email,
          :subject => 'Nous avons bien reçu votre demande de sourcing, merci pour votre confiance' )
  end
end
