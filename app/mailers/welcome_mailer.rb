class WelcomeMailer < ApplicationMailer
  default from: "megimu@gmail.com"

  def welcome_email
    @user = params[:user]
    @url = "http://example.com/login"
    mail(to: @user.email, subject: "welcome to my awesome site")
  end
end
