feature "Sending a request" do
  before do
    sign_up
    create_space
  end

  scenario "a user can send a request and get a confirmation" do
    send_request
    expect(page).to have_content "Thanks, your booking request is pending!"
  end

  scenario "user must pick a date to send a request" do
    send_request(start_date: "")
    expect(page).to have_content "Please, pick a date!"
  end

  scenario "user cannot send a request for a date outside of availability" do
    send_request(start_date: "10/05/2019")
    expect(page).to have_content "Space is not available for this day"
  end

  scenario "user cannot book a booked and approved night" do
    visit '/spaces'
    send_request
    approve_request
    visit '/spaces'
    send_request
    expect(page).to have_content "This date is already booked"

  end
end
