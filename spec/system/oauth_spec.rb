# spec/system/pages_spec.rb
require "rails_helper"

RSpec.describe "GitHub OAuth", type: :system do
  it "creates and logs in a user via GitHub" do
    mock_github_auth(
      email: "test@github.com",
      name: "Test",
      bio: "I am a test!"
    )
    visit new_user_session_path
    click_button "Sign in with GitHub"
    expect(page).to have_content("post something:")
    user = User.last
    expect(user).not_to be_nil
    expect(user.email).to eq("test@github.com")
  end
end
