feature "Viewing spaces" do
  before do
    sign_up
    create_space
  end

  scenario "there's a link which goes to the specific space" do
    space_id = Space.last.id
    visit '/spaces'
    click_link "Victoria Gardens"
    expect(current_path).to eq "/spaces/#{space_id}"
  end
  scenario "able to view a particular space" do
    space_id = Space.last.id
    visit "/spaces/#{space_id}"
    expect(page).to have_content "Victoria Gardens"
  end
  scenario "able to view a second, different space" do
    create_space(name: "Jonny's love island")
    space_id = Space.last.id
    visit "/spaces/#{space_id}"
    expect(page).to have_content "Jonny's love island"
  end
end
