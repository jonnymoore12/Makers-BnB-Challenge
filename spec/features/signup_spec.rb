feature "#Signup" do
  scenario "user can sign up" do
    visit '/'
    fill_in :email, with: "example@mail.com"
    fill_in :password, with: "secret123456"
    fill_in :password_confirmation, with: "secret123456"
    click_button "Sign Up"
    expect(page).to have_content "Welcome, example@mail.com"
  end

end
