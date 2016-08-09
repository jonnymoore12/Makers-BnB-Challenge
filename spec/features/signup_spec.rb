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

  scenario "user cannot sign up with blank email" do
    sign_up(email: "")
    expect(page).to have_content "Email must not be blank"
  end

  scenario "user cannot sign up with an invalid email" do
    sign_up(email: "ggg/!$")
    expect(page).to have_content "Email has an invalid format"
  end

  scenario "user cannot sign up with an empty passsword" do
    sign_up(password: "")
    expect(page).to have_content "Password must not be blank email"
  end

end
