feature "#Signup" do
  scenario "user can sign up" do
    sign_up
    expect(page).to have_content "Welcome, example@email.com"
  end

end
