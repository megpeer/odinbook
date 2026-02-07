# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
    def welcome_email
      @user = User.last || User.new(name: "test user", email: "test@test.test")
      WelcomeMailer.with(user: @user).welcome_email
    end
end
