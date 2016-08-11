feature "Listing a space" do
  scenario "/spaces has a 'list a space button' " do
    visit '/spaces'
    expect(page).to have_button "List a Space"
    click_button "List a Space"
    expect(current_path).to eq "/spaces/new"
  end

  scenario "cannot add a space unless logged in" do
    visit '/spaces/new'
    expect(page).to have_content "Must be logged in to add a Space"
  end

  scenario "can list a space" do
    sign_up
    create_space
    expect(current_path).to eq "/spaces"
    within('ul#space-list') do
      expect(page).to have_content "Victoria Gardens"
    end
  end

  scenario "all but 'description' fields are required" do
    sign_up
    create_space(name: nil, price: nil, available_from: nil, available_to: nil)
    expect(page).to have_content "Name must not be blank"
    expect(page).to have_content "Price must not be blank"
    expect(page).to have_content "Available to must not be blank"
    expect(page).to have_content "Available from must not be blank"
  end

  scenario "listed space belongs to user" do
    sign_up
    create_space
    user = User.first
    expect(user.spaces).to include(Space.first)
  end

  scenario "multiple listed spaces belong to user" do
    sign_up
    create_space
    create_space
    user = User.first
    expect(user.spaces).to include(Space.first, Space.last)
  end

  scenario "space cannot be listed as available_from a past date" do
    sign_up
    create_space(available_from:(Date.today -1))
    expect(page).to have_content "Space cannot be available in the past"
  end

  scenario "space cannot be listed as available_to a past date" do
    sign_up
    create_space(available_to:(Date.today - 1))
    expect(page).to have_content "Space cannot be available in the past"
  end

end
