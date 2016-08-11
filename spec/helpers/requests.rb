module RequestsHelpers
  def send_request
    click_link "Victoria Gardens"
    fill_in :start_date, with: "20/05/2019"
    click_button "Request to Book"
  end
end
