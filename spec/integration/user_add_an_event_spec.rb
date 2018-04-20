require 'rails_helper.rb'

feature "User adds an article" do

    scenario "User successfully navigates to the New Event from the Your Events page" do
        visit events_path
        expect(page).to have_content("Your Events")
        click_link "New Event"
        expect(page).to have_content("Add New Event")
=begin
        expect(page).to have_field("Title:")
	    expect(page).to have_field("Location:")
        expect(page).to have_field("Information:")
        expect(page).to have_field("Date:")
        expect(page).to have_field("Starting Time:")
        expect(page).to have_field("Ending Time:")
        expect(page).to have_field("Tag:")
=end
    end
   
    scenario "User successfully creates a new event" do
	    visit new_event_path
    	expect(page).to have_content("Add New Event")
	    fill_in "Title:", with:  "New Capybara Event"
    	fill_in "Location:", with: "Charlotte"
    	fill_in "Information:", with: "This is a new Capybara event"
    	fill_in "Date:", with: "04-01-2018"
    	fill_in "Starting Time:", with: "1pm"
    	fill_in "Ending Time:", with: "2pm"
    	fill_in "Tag:", with: "UNCC"
    	click_button "Create Event"
    	expect(page).to have_content("New Capybara Event")
    end

end

feature "User deletes an event" do
    scenario "User successfully navigates to the Your Events page from the Your Calendar page" do
        visit events_path
        expect(page).to have_content ("Your Events")
    end
    
    scenario "User successfully deletes an event" do
        visit events_path
        click_button "Delete Event"
        expect(page).to have_content ("Your Events")
    end
end

feature "User creates a new tag" do

    scenario "User successfully navigates to the Add New Tag page from the Your Tags page" do
        visit tags_path
        expect(page).to have_content("Your Tags")
        click_button "New Tag"
        expect(page).to have_content("Add New Tag")
        expect(page).to have_field("Tag Name:")
	    expect(page).to have_field("Description:")
    end
   
    scenario "User successfully creates a new tag" do
	    visit new_tags_path
    	expect(page).to have_content("Add New Tag")
	    fill_in "Title:", with:  "Test"
    	fill_in "Description:", with: "Capybara tag"
    	click_button "Create Tag"
    	expect(page).to have_content("Test")
    end

end
