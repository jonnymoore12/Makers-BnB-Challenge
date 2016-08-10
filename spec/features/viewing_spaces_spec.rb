feature "Viewing spaces" do
  scenario "able to view a particular space" do
    sign_up
    create_space
    visit '/spaces/1'
    expect(page).to have_content "Victoria Gardens"
  end
end
