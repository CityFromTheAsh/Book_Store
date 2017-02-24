class BookMailer < ApplicationMailer
  default from: 'CityFromTheAsh@gmail.com'

  def notification_about_order(user)
    @user = user
    mail(to: @user.email, subject: 'Щось в лiсi сдохло! вашу книгу заказали')

  end
end
