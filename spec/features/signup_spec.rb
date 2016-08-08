feature "#Signup" do
  scenario "user can sign up" do
    sign_up
    expect(page).to have_content "Welcome, example@email.com"
  end

  scenario "user cannot sign up when passwords do not match" do
    sign_up(password_confirmation: "somethingdifferent")
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "user cannot sign up when the email is already taken" do
    sign_up
    sign_up
    expect(page).to have_content "Email is already taken"
  end

end
