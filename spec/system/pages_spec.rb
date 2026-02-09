# spec/system/pages_spec.rb
require "rails_helper"

RSpec.describe "Pages", type: :system do
  # this wont work unless user is logged in,
  # and will re-diret to login page.
  it "loads the home page" do
    visit root_path
    expect(page).to have_content("Welcome")
  end
end
RSpec.describe "Feed", type: :system do
  let(:user) { create(:user) }

  it "loads feed for logged in user" do
    sign_in user
    visit feed_path
    expect(page).to have_content("Feed")
  end
end


# Home page loads

# Feed loads (logged in)

# Profile page loads

# New post page loads
