require 'rails_helper'
#
# As a guest user
# When I visit "/"
# And I enter "2018-01-01" into the start date
# And I enter "2018-01-07" into the end date
# And I click "Determine Most Dangerous Day"
#
# Then I should be on "/most_dangerous_day"
# And I should see a heading for "Most Dangerous Day"
# And I should see "January 1, 2018 - January 7, 2018"
# And I should see a heading for the most dangerous day in that range "January 1, 2018"
# And I should see 3 asteroids in that list
#
# And I should see "Name: (2014 KT76)"
# And I should see "NEO Reference ID: 3672906"
#
# And I should see "Name: (2001 LD)"
# And I should see "NEO Reference ID: 3078262"
#
# And I should see "Name: (2017 YR1)"
# And I should see "NEO Reference ID: 3794979"

RSpec.describe 'As a visitor' do
  describe 'on the home page' do

    it "can search most dangerous day" do
      visit root_path

      fill_in :start_date, with: "2018-01-01"
      fill_in :end_date, with: "2018-01-07"

      click_button "Determine Most Dangerous Day"

      expect(current_path).to eq(most_dangerous_day_path)

      expect(page).to have_content("For Range:")
      expect(page).to have_content("January 1, 2018 - January 7, 2018")

      within "#most-dangerous-day" do
        expect(page).to have_content('Most Dangerous Day:')
        expect(page).to have_content('January 1, 2018')
        expect(page).to have_css('.asteroid', count: 3)

        expect(page).to have_content("Name: (2001 LD)")
        expect(page).to have_content("NEO Reference ID: 3078262")

        expect(page).to have_content("Name: (2014 KT76)")
        expect(page).to have_content("NEO Reference ID: 3672906")

        expect(page).to have_content("Name: (2017 YR1)")
        expect(page).to have_content("NEO Reference ID: 3794979")
      end
    end

    it "can't search more than 7 days" do
      visit root_path

      fill_in :start_date, with: "2018-01-01"
      fill_in :end_date, with: "2018-01-09"

      click_button "Determine Most Dangerous Day"

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Please Enter Dates 7 Days or Less Apart')
    end

    it "can't search if dates invalid" do
      visit root_path

      fill_in :start_date, with: "aaa"
      fill_in :end_date, with: "2018-01-09"

      click_button "Determine Most Dangerous Day"

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Please Enter Dates 7 Days or Less Apart')
    end

    it "it can take datetime form inputs" do
      visit root_path

      fill_in :start_date, with: "1 July, 2019"
      fill_in :end_date, with: "4 July, 2019"

      click_button "Determine Most Dangerous Day"

      within "#most-dangerous-day" do
        expect(page).to have_content('Most Dangerous Day:')
        expect(page).to have_content("July 4, 2019")
        expect(page).to have_css('.asteroid', count: 2)

        expect(page).to have_content("Name: (2014 QO296)")
        expect(page).to have_content("NEO Reference ID: 3683806")
      end
    end

  end
end
