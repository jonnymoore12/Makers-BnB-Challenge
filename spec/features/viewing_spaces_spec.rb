feature "Viewing spaces" do
  before do
    sign_up
    create_space
  end

  scenario "able to view a particular space" do
    visit '/spaces/1'
    expect(page).to have_content "Victoria Gardens"
  end
  scenario "able to view a second, different space" do
    create_space(name: "Jonny's love island")
    visit '/spaces/2'
    expect(page).to have_content "Jonny's love island"
  end
end
