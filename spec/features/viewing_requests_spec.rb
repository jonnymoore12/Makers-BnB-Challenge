feature "Viewing sent/received requests" do
  before do
    sign_up
    create_space
    send_request
    visit '/requests'
  end

  scenario "User can view his sent requests" do
    within("ul#sent-requests") do
      expect(page).to have_content "Sent request for: Victoria Gardens"
    end
  end

  scenario "User can view received requests" do
    within("ul#received-requests") do
      expect(page).to have_content "Received request for: Victoria Gardens"
    end
  end

  scenario "Host can see pending requests" do
    within("ul#received-requests") do
      expect(page).to have_content "Status: pending"
    end
  end

  scenario "there's a link which goes to the specific request" do
    request_id = Request.last.id
    click_link "Victoria Gardens"
    expect(current_path).to eq "/requests/#{request_id}"
  end
end
