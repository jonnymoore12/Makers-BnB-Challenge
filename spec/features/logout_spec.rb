feature 'Log Out' do
  scenario 'User can log out' do
    sign_up
    log_in
    click_button "Log Out"
    expect(page).to have_content "Goodbye!"
    expect(page).not_to have_content "You're logged in"
  end
end
