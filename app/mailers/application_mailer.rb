class ApplicationMailer < ActionMailer::Base

  default :from => 'contact@choublanc.fr'
  layout 'mailer'

  add_template_helper(EmailHelper)
end
