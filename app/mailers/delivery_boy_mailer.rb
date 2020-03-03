class DeliveryBoyMailer < ApplicationMailer

  def welcome_email
    @delivery_boy = params[:delivery_boy]
    @url  = 'http://localhost:3000/delivery_boy/login'
    mail(to: @delivery_boy.email, subject: 'Welcome to My Site')
  end
end
