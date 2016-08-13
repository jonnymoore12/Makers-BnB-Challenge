feature '#Login' do
  let!(:user) do
    User.create(email: "example@email.com",
                password: "secret",
                password_confirmation: "secret")
  end

  scenario 'User can log in' do
    log_in
    expect(page).to have_content("You're logged in")
  end

  scenario 'User cannot log in with incorrect credentials' do
    log_in(password: 'badpassword')
    expect(page).to have_content("Password or email was incorrect")
    expect(page).not_to have_content("You're logged in")
  end

  scenario 'There should be a "log in" button when not logged in' do
    visit '/'
    expect(page).to have_link "Log In"
  end

  scenario "User cannot go to requests route if not logged in" do
    visit '/requests'
    expect(page).to have_content("Please sign up or log in to view requests")
  end

  scenario "Spaces is the root if user is already logged in" do
    log_in
    visit '/'
    expect(current_path).to eq '/spaces'
  end
end
