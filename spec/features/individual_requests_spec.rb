feature "View specific request" do
  before do
    sign_up
    create_space
    send_request
  end

  scenario "host can see an 'Approve Request' button on the page" do
    view_received_request
    expect(page).to have_button("Approve Request")
  end

  scenario "details of space are displayed on page" do
    view_received_request
    expect(page).to have_content "Victoria Gardens"
  end

  scenario "host is returned back to '/request' page after approving a request" do
    view_received_request
    click_button "Approve Request"
    expect(page.current_path).to eq '/requests'
  end

  scenario "approving a request automatically denies other requests for same date" do
    send_request
    first_request = Request.first
    second_request = Request.last
    visit "/requests/#{first_request.id}"
    click_button "Approve Request"
    visit "/requests/#{second_request.id}"
    expect(page).to have_content("Status: denied")
  end

  scenario "host approving a request changes request status to 'approved' " do
    view_received_request
    click_button "Approve Request"
    #We are not looking at a specific request
    within("ul#received-requests") do
      expect(page).to have_content "Status: approved"
    end
  end

  scenario "approving a request automatically denies other requests for same date" do
    send_request
    first_request = Request.first
    second_request = Request.last
    visit "/requests/#{first_request.id}"
    click_button "Approve Request"
    visit "/requests/#{second_request.id}"
    expect(page).to have_content("Status: denied")
  end

  scenario "host denying a request changes the request status to 'denied' " do
    view_received_request
    click_button "Deny Request"
    #We are not looking at a specific request
    within("ul#received-requests") do
      expect(page).to have_content "Status: denied"
    end
  end

  scenario "only the host of the space can approve/deny" do
    click_button "Log Out"
    sign_up(email: "newguest@email.com", password: "secret",
            password_confirmation: "secret")
    send_request
    view_sent_request
    expect(page).not_to have_button("Approve Request")
    expect(page).not_to have_button("Deny Request")
  end
end
