require "rails_helper"

describe "pokemon", type: :feature do

	it "has an Add Pokemon link" do
		visit "/pokemons"
		click_link "Add a Pokémon"
		expect(page).to have_content "Creating New Pokémon"
	end

	it "correctly saves a new Pokemon" do
		visit "/pokemons/new"
		expect(page).to have_content "Creating New Pokémon"

		fill_in "Name", with: "Bulbasaur"
		fill_in "Pokédex #", with: "1"
		check "Can be shiny"

		click_button "Create Pokemon"

		expect(page).to have_content "Bulbasaur"
		expect(page).to have_content "1"
		expect(page).to have_content "Shiny available"
	end

	it "correctly edits an existing Pokemon" do
		create(:pokemon)
		visit "/pokemons/#{Pokemon.first.id}"

		click_link "Edit"

		fill_in "Name", with: "Ivysaur"
		fill_in "Pokédex #", with: "2"
		uncheck "Can be shiny"

		click_button "Update Pokemon"
		expect(page).to have_content "Ivysaur"
		expect(page).to have_content "2"
		expect(page).to have_content "Shiny not officially available"
	end

	it "correctly lists existing Pokemon at index" do
		create(:pokemon)
		visit "/pokemons"
		expect(page).to have_content "Bulbasaur"
	end

	it "correctly deletes Pokemon" do
		Capybara.current_driver = :selenium_headless
		create(:pokemon)
		visit "/pokemons/#{Pokemon.first.id}"

		accept_confirm do
			click_link "Delete"
		end

		expect(page).to have_content "There are no Pokémon in the database yet!"
	end
end
