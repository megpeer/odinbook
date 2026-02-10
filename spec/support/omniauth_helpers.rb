# spec/support/omniauth_helpers.rb
module OmniauthHelpers
  def mock_github_auth(email: "test", name: "test", bio: "test")
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      provider: "github",
      uid: "123545",
      info: {
        email: email,
        name: name
      },
      extra: {
        raw_info: {
          bio: bio
        }
      }
    )
  end
end
