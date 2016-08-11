feature "Viewing sent/received requests" do
  scenario "User can view his sent requests" do
    sign_up
    create_space
    send_request
    visit '/requests'
    within("ul#sent-requests") do
      expect(page).to have_content "Sent request for: Victoria Gardens"
    end
  end
end
