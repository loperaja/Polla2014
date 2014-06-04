class PollaMailer < ActionMailer::Base
  default from: "Polla Brasil 2014 <no-responder@polla.loperaja.com>"
  
  def welcome_email(user)
    @user = user
    @url = 'http://polla.loperaja.com'
    mail(to: @user.email, subject: "Polla 2014: Se ha registrado exitosamente", content_type: "text/html")
  end

  def payment_notification(polla)
    @polla = polla
    @user = @polla.user
    mail(to: "loperaja@gmail.com", subject: "#{@user.name}: Confirmación del pago", content_type: "text/html")
  end
  
end
