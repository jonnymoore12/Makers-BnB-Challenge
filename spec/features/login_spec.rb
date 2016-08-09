feature '#Login' do
  scenario 'User can log in' do
    sign_up
    log_in
    expect(page).to have_content("Welcome back example@email.com!")
  end

  scenario 'user cannot log in with an empty email' do
    log_in(email: "")
    expect(page).to have_content "Email cannot be blank"
  end
end
