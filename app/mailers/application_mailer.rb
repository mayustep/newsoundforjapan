class ApplicationMailer < ActionMailer::Base
  default from: 'New Sound For Japan <hello@newsoundforjapan.com>'
  add_template_helper ApplicationHelper
  layout 'mailer'
  
  def payment_confirmation(payment, password = nil)
    @payment = payment
    @password = password
    mail :to => @payment.user.email, :subject => t(".thank_you", :fund => @payment.fund.name)
  end
  
  def booking_inquiry(booking)
    @booking = booking
    embed_data = {
      :topicable_id => @booking.id,
      :topicable_type => 'Booking'
    }
    crypt = ActiveSupport::MessageEncryptor.new(ENV['SECRET_KEY_BASE'])
    encrypted = crypt.encrypt_and_sign(embed_data.to_json)
    reply_to = "reply+#{encrypted}@relay.newsoundforjapan.com"
    mail :to => @booking.bookee.email,
      :from => "#{@booking.booker.display_name} | New Sound For Japan <hello@newsoundforjapan.com>",
      :subject => "Event on #{@booking.event.start_at}",
      :reply_to => "#{@booking.booker.display_name} <#{reply_to}>"
  end
end
