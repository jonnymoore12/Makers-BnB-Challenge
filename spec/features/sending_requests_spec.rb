feature "Sending a request" do

  scenario "User can send a request and get a confirmation" do
    sign_up
    create_space
    send_request
    expect(page).to have_content "Thanks, your booking request is pending!"
  end

  scenario "User must pick a date to send a request" do
    sign_up
    create_space
    send_request(start_date: "")
    expect(page).to have_content "Please, pick a date!"
  end

  # scenario "User cannot book his own space" do
  #   sign_up
  #   create_space
  #   send_request
  #   expect(page).to have_content "You can't book your own space"
  # end
end
