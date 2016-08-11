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

  scenario "host approving a request changes request status to 'approved' " do
    view_received_request
    click_button "Approve Request"
    #We are not looking at a specific request
    within("ul#received-requests") do
      expect(page).to have_content "Status: approved"
    end
  end

  scenario "host denying a request changes the request status to 'denied' " do
    view_received_request
    click_button "Deny Request"
    #We are not looking at a specific request
    within("ul#received-requests") do
      expect(page).to have_content "Status: denied"
    end
  end
end
