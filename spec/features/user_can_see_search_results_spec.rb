require 'rails_helper'

describe 'when I enter a zip and click locate on the home page' do

  before(:each) do
    visit root_path
    fill_in "input#q.form-control" with "80203"
    click_on "Locate"
  end

  it 'displays 10 closest stations within 6 miles' do
    within("section.stations") do
      expect(page).to have_css("li.station", count => 10)
      expect(page).to have_content("closest station")
      expect(page).to have_content("tenth station")
      expect(page).to_not have_content("eleventh station")
    end
  end

  it 'sorts stations by distance' do
    within("station.sections") do
      # expect first distance to be less than second distance, etc.
    end
  end

  it 'only displays electric and propane stations' do

    # 'ELEC' & 'LPG' only
    within("station.sections") do
      expect(page).to_not have_content("Fuel Type: BD")
      expect(page).to_not have_content("Fuel Type: E85")
      expect(page).to_not have_content("Fuel Type: HY")
      expect(page).to_not have_content("Fuel Type: LNG")
      expect(page).to_not have_content("Fuel Type: CNG")
    end
  end

  it 'displays name, address, fuel types, distance, and access times for each station' do
    within("li.station#1") do
      expect(page).to have_content("name")
      expect(page).to have_content("address")
      expect(page).to have_content("fuel types")
      expect(page).to have_content("distance")
      expect(page).to have_content("access time")
    end
  end

end
