class SourcingMailer < ApplicationMailer

  def sourcing_request(sourcing)
    @sourcing = sourcing
    mail( :to => @sourcing.email,
          :subject => 'Nous avons bien reçu votre demande de sourcing, merci pour votre confiance' )
  end

  def sourcing_alarm(sourcing)
    @sourcing = sourcing
    mail( :to => ['antoine.guilguet@hec.edu', 'lucile.dauger@hec.edu', 'mathilde.desruelle@hec.edu', 'baptiste.grandclerc@hec.edu'],
          :subject => 'Nouvelle demande de sourcing' )
  end
end
