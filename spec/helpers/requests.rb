module RequestsHelpers
  def send_request(start_date: "20/05/2019")
    click_link "Victoria Gardens"
    fill_in :start_date, with: start_date
    click_button "Request to Book"
  end
end