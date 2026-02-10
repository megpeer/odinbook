# spec/system/pages_spec.rb
require "rails_helper"

RSpec.describe "Pages", type: :system do
  let(:user) { create(:user) }
  it "loads sign in page if not logged in" do
    visit root_path
    expect(page).to have_content("Sign In")
  end
  it "loads the home page" do
    sign_in_as(user)
    visit root_path
    expect(page).to have_content("post something:")
  end
  it "loads feed for logged in user" do
    sign_in_as(user)
    puts page.current_path
    visit feed_path
    expect(page).to have_content("Feed")
  end
  it "need to sign in before continuing" do
    visit feed_path
    expect(page).to have_content("Sign In")
  end
end
