class SignupMailer < ApplicationMailer
  default from: 'notifications@odinfacebook.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Thank you for signing up')
  end
end
