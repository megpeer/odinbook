class WelcomeMailer < ApplicationMailer
  def welcome_email
    # @user = params[:user]
    @user = User.last
    @url = "https://odinbook-yvnb.onrender.com/"
    mail(to: @user.email, subject: "welcome to my awesome site")
  end
end
