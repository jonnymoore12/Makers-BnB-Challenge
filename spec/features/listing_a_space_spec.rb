feature "Listing a space" do
  scenario "/spaces has a 'list a space button' " do
    visit '/spaces'
    expect(page).to have_button "List a Space"
    click_button "List a Space"
    expect(current_path).to eq "/spaces/new"
  end

  scenario "can list a space" do
    visit '/spaces/new'
    fill_in :name, with: "Victoria Gardens"
    fill_in :description, with: "Some nice shit"
    fill_in :price_per_night, with: "89.99"
    fill_in :available_from, with: "15/05/15"
    fill_in :available_to, with: "24/05/15"
    click_button "List my Space"

    expect(current_path).to eq "/spaces"
    expect(page).to have_content "Victoria Gardens"
  end
end
