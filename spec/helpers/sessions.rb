module SessionHelpers
  def sign_up(email: "example@email.com", password: "secret",
              password_confirmation: "secret")
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Sign Up"
  end

  def log_in(email: "example@email.com", password: "secret")
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Log In"
  end
end
