module SystemHelpers
  def sign_in_as(user)
    visit new_user_session_path

    within('form[action="/users/sign_in"]') do
      fill_in "Email", with: user.email
      fill_in "Password", with: "password123"
      find('input[type="submit"]').click
    end
    expect(page).not_to have_content("Sign In")
  end
end
