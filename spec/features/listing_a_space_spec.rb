feature "Listing a space" do
  scenario "/spaces has a 'list a space button' " do
    visit '/spaces'
    expect(page).to have_button "List a Space"
    click_button "List a Space"
    expect(current_path).to eq "/spaces/new"
  end

  scenario "can list a space" do
    create_space
    expect(current_path).to eq "/spaces"
    within('ul#space-list') do
      expect(page).to have_content "Victoria Gardens"
    end
  end

  scenario "all but 'description' fields are required" do
    create_space(name: nil, price: nil, available_from: nil, available_to: nil)
    expect(page).to have_content "Name must not be blank"
    expect(page).to have_content "Price must not be blank"
    expect(page).to have_content "Available to must not be blank"
    expect(page).to have_content "Available from must not be blank"
  end
end
