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
end
