class UserMailer < ApplicationMailer
  default from: 'ramchandanitanya@gmail.com'
  def welcome_email(user)
    @user = user
    @url  = 'https://shielded-cliffs-43176.herokuapp.com/sessions/login'
    mail(to: @user.email, subject: 'Welcome onboard :)')
  end
end
