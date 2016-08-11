feature "Sending a request" do

  scenario "a user can send a request and get a confirmation" do
    sign_up
    create_space
    send_request
    expect(page).to have_content "Thanks, your booking request is pending!"
  end

  scenario "user must pick a date to send a request" do
    sign_up
    create_space
    send_request(start_date: "")
    expect(page).to have_content "Please, pick a date!"
  end
end
