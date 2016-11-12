class UserMailer < ApplicationMailer
  default from: "deCODE@eljojo.me"
 
  def send_credit(user, destination, credit)
    @first_name = user
    @credit = credit
    mail(to: destination, subject: "Store Credit!")
  end
end
