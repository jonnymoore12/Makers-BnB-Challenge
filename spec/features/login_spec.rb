feature '#Login' do
  scenario 'User can log in' do
    sign_up
    log_in
    expect(page).to have_content("Welcome back example@email.com!")
  end
end
