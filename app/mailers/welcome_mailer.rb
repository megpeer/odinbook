class WelcomeMailer < ApplicationMailer
  def welcome_email
    # @user = params[:user]
    @user = User.last
    @url = "http://localhost:3000/login"
    mail(to: @user.email, subject: "welcome to my awesome site")
  end
end
