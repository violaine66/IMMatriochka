class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject

  def welcome
    @user = params[:user] # On récupère l'utilisateur depuis params
    mail(to: @user.email, subject: "Welcome #{@user.nickname}")
  end
end
