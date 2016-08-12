module RequestsHelpers
  def send_request(start_date: "20/05/2019")
    click_link "Victoria Gardens"
    fill_in :start_date, with: start_date
    click_button "Request to Book"
  end

  def view_received_request
    visit '/requests'
    within("ul#received-requests") do
      click_link "Victoria Gardens"
    end
  end

  def view_sent_request
    visit '/requests'
    within("ul#sent-requests") do
      click_link "Victoria Gardens"
    end
  end

  def approve_request
    view_received_request
    click_button 'Approve Request'
  end

  def deny_request
    view_received_request
    click_button 'Deny Request'
  end
end
