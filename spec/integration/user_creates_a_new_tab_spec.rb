require 'rails_helper.rb'


feature "User creates a new tag" do

    scenario "User successfully navigates to the Add New Tag page from the Your Tags page" do
        visit tags_path
        expect(page).to have_content("Your Tags")
        click_link "New Tag"
        expect(page).to have_content("Add New Tag")
        expect(page).to have_field("tag[tagName]")
	    expect(page).to have_field("tag[description]")
    end
   
    scenario "User successfully creates a new tag" do
	    visit new_tag_path
    	expect(page).to have_content("Add New Tag")
	    fill_in "tag[tagName]", with:  "Test"
    	fill_in "tag[description]", with: "Capybara tag"
    	click_button "Create Tag"
    	expect(page).to have_content("Test")
    end

end
