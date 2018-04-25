require 'rails_helper.rb'


feature "User edits an event" do
    scenario "User successfully navigates to the Your Events page from the Your Calendar page" do
        visit events_path
        expect(page).to have_content ("Your Events")
    end
    
    scenario "User successfully edits their event" do
        # Create the tag.
        visit new_tag_path
        fill_in "tag[tagName]", with:  "Test"
    	fill_in "tag[description]", with: "Capybara tag"
    	click_button "Create Tag"
    	
    	# Create the event associated to that tag.
	    visit new_event_path
    	expect(page).to have_content("Add New Event")
	    fill_in "event[title]", with: "New Capybara Event"
    	fill_in "event[location]", with: "Charlotte"
    	fill_in "event[eventInformation]", with: "This is a new Capybara event"
    	select "April", :from => "event[eventDate(2i)]"
    	select "1", :from => "event[eventDate(3i)]"
    	select "2018", :from => "event[eventDate(1i)]"
    	select "01 PM", :from => "event[startTime(4i)]"
    	select "00", :from => "event[startTime(5i)]"
    	select "02 PM", :from => "event[endTime(4i)]"
    	select "00", :from => "event[endTime(5i)]"
    	select "Test", :from => "event[tag_id]"
    	click_button "Create Event"
    	expect(page).to have_content("New Capybara Event")
    	
    	# Delete that event.
        visit events_path
        click_link "Edit Event"
        fill_in "event[title]", with: "New Capybara Event Test"
        click_button "Update Event"
        expect(page).to have_content ("New Capybara Event Test")
    end
end
