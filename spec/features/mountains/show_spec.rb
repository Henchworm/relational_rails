RSpec.describe "the mountain show page", type: :feature do
  before(:each) do
    @mtn_range_1 = MtnRange.create!(name: "Sierra Nevada",
                                  natl_park_land: false,
                                  drivetime: 16)
    @mountain_1 = @mtn_range_1.mountains.create!(name: "Black Kaweah",
                                                elevation: 13681,
                                                safe_winter_route: false)

    visit "/mountains/#{@mountain_1.id}"
  end

  it "displays the mountain name" do
    expect(page).to have_content(@mountain_1.name)
  end

  it "displays the mountain elevation" do
    expect(page).to have_content(@mountain_1.elevation)
  end

  it "displays whether or not there is a safe winter route" do
    expect(page).to have_content(@mountain_1.safe_winter_route)
  end


  it "displays link to update the mountain" do
    expect(page).to have_link("Update #{@mountain_1.name}")
  end

  it 'has a link that routes to /mountains/:id/edit' do
    click_link "Update #{@mountain_1.name}"
    expect(current_path).to eq("/mountains/#{@mountain_1.id}/edit")
  end

  it 'displays a link to delete the mountain' do
    expect(page).to have_link("Delete #{@mountain_1.name}")
  end

  it "routes from deleting to index" do
    click_link("Delete #{@mountain_1.name}")
    expect(current_path).to eq("/mountains")
  end

  it "does not display delete records" do
    click_link("Delete #{@mountain_1.name}")
    expect(page).to_not have_content(@mountain_1.name)
  end




end
