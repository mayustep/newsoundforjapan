class ApplicationMailer < ActionMailer::Base
  default from: 'New Sound For Japan <hello@newsoundforjapan.com>'
  layout 'mailer'
  
  def payment_confirmation(payment, password = nil)
    @payment = payment
    @password = password
    mail :to => @payment.user.email, :subject => t(".thank_you", :fund => @payment.fund.name)
  end
end
