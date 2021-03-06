feature "Viewing sent/received requests" do
  before do
    sign_up
    create_space
    send_request
    request = Request.first
    request.id = 100
    request.save
    visit '/requests'
  end

  scenario "User can view his sent requests" do
    within("ul#sent-requests") do
      expect(page).to have_content "Sent request for: #100 Victoria Gardens"
    end
  end

  scenario "User can view received requests" do
    within("ul#received-requests") do
      expect(page).to have_content "Received request for: #100 Victoria Gardens"
    end
  end

  scenario "Host can see pending requests" do
    within("ul#received-requests") do
      expect(page).to have_content "Status: pending"
    end
  end

  scenario "User can view date of stay on request" do
    expect(page).to have_content "Date of stay: 20/05/2019"
  end

  scenario "there's a link which goes to the specific received request" do
    within("ul#received-requests") do
      request_id = Request.last.id
      click_link "Victoria Gardens"
      expect(current_path).to eq "/requests/#{request_id}"
    end
  end
end
