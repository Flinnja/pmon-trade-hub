require "rails_helper"

describe "pokemon species", type: :feature do

	it "has an Add Pokemon Species link" do
		visit "/pokemon_species"
		click_link "Add a Pokémon Species"
		expect(page).to have_content "Creating New Pokémon Species"
	end

	it "correctly saves a new Pokemon" do
		visit "/pokemon_species/new"
		expect(page).to have_content "Creating New Pokémon Species"

		fill_in "Name", with: "Bulbasaur"
		fill_in "Pokédex #", with: "1"
		check "Can be shiny"

		click_button "Create Pokemon species"

		expect(page).to have_content "Bulbasaur"
		expect(page).to have_content "1"
		expect(page).to have_content "Shiny available"
	end

	it "correctly edits an existing Pokemon" do
		create(:pokemon_species)
		visit "/pokemon_species/#{PokemonSpecies.first.id}"

		click_link "Edit"

		fill_in "Name", with: "Ivysaur"
		fill_in "Pokédex #", with: "2"
		uncheck "Can be shiny"

		click_button "Update Pokemon species"
		expect(page).to have_content "Ivysaur"
		expect(page).to have_content "2"
		expect(page).to have_content "Shiny not officially available"
	end

	it "correctly lists existing Pokemon Species at index" do
		create(:pokemon_species)
		visit "/pokemon_species"
		expect(page).to have_content "Bulbasaur"
	end

	it "correctly deletes Pokemon Species" do
		Capybara.current_driver = :selenium_headless
		create(:pokemon_species)
		visit "/pokemon_species/#{PokemonSpecies.first.id}"

		accept_confirm do
			click_link "Delete"
		end

		expect(page).to have_content "There are no Pokémon Species in the database yet!"
	end
end
