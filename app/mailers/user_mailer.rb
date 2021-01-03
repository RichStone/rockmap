class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome')
  end

  def reminder_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Your reminder')
  end
end
