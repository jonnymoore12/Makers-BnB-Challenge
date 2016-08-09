feature '#Login' do
  let!(:user) do
    User.create(email: "example@email.com",
                password: "secret",
                password_confirmation: "secret")
  end

  scenario 'User can log in' do
    sign_up
    log_in
    expect(page).to have_content("You're logged in")
  end

  scenario 'User cannot log in with incorrect credentials' do
    log_in(password: 'badpassword')
    expect(page).to have_content("Password or email was incorrect")
    expect(page).not_to have_content("You're logged in")
  end

end
