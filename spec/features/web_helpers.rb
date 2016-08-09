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

def create_space(name: "Victoria Gardens",
                 description: "some cool stuff",
                 price: "89.99",
                 available_from: "15/05/2015",
                 available_to: "24/05/2015")
  visit '/spaces/new'
  fill_in :name, with: name
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :available_from, with: available_from
  fill_in :available_to, with: available_to
  click_button "List my Space"
  
end
