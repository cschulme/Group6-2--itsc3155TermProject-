require 'rails_helper.rb'


feature "User uses calendar" do
    scenario "User successfully navigates to the Your Calendar page from the home page" do
        visit calendar_views_path
        expect(page).to have_content ("Your Calendar")
    end
    
    scenario "User successfully navigates to August" do
        visit calendar_views_path
        expect(page).to have_content("Your Calendar")
        click_link "August"
        expect(page).to have_content ("August 2018")
    end
end