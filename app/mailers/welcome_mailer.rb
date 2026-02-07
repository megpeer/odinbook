class WelcomeMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    # @user = User.last
    @url = "https://odinbook-yvnb.onrender.com/"
    # Rails.logger.info "WELCOME MAILER CALLED for #{@user.email}"
    mail(to: @user.email, subject: "welcome to OdinBook")
  end
end
