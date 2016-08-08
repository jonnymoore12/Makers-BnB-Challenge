feature '#Login' do
  scenario 'User can log in' do
    visit '/'
    fill_in :email, with: "example@mail.com"
    fill_in :password, with: "secret123456"
    fill_in :password_confirmation, with: "secret123456"
    click_button "Sign Up"

    visit '/sessions/new'
    fill_in :email, with: "example@mail.com"
    fill_in :password, with: "secret123456"
    click_button "Log In"
    expect(page).to have_content("Welcome back example@mail.com!")
  end
end
