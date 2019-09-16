require "rails_helper"

describe "types", type: :feature do

	it "correctly saves a new Type" do
		visit "/types/new"
		expect(page).to have_content "Creating New Type"

		fill_in "Name", with: "Grass"

		click_button "Create Type"

		expect(page).to have_content "Grass"
	end

	it "correctly edits an existing Type" do
		create(:type)
		visit "/types/#{Type.first.id}"

		click_link "Edit"

		fill_in "Name", with: "Normal"

		click_button "Update Type"
		expect(page).to have_content "Normal"
	end

	it "correctly lists existing Types at index" do
		create(:type)
		visit "/types"
		expect(page).to have_content "Normal"
	end

	it "correctly deletes Types" do
		Capybara.current_driver = :selenium_headless
		create(:type)
		visit "/types/#{Type.first.id}"

		accept_confirm do
			click_link "Delete"
		end

		expect(page).to have_content "There are no Types in the database yet!"
	end
end
