class PokemonSpeciesController < ApplicationController
  def index
  	@pokemon_species = PokemonSpecies.all.order(:national_dex_no)
  end

  def show
  	@pokemon = PokemonSpecies.find(params[:id])
  end

  def new
  	@pokemon = PokemonSpecies.new
  end

  def create
  	@pokemon = PokemonSpecies.new
  	@pokemon.assign_attributes(pokemon_species_params)

  	if @pokemon.save
  		redirect_to pokemon_species_path(@pokemon), notice: "Pokémon Species created"
  	else
  		render :new
  	end
  end

  def edit
  	@pokemon = PokemonSpecies.find(params[:id])
  end

  def update
  	@pokemon = PokemonSpecies.find(params[:id])
  	@pokemon.assign_attributes(pokemon_species_params)
  	if @pokemon.save
  		redirect_to pokemon_species_path(@pokemon), notice: "Pokémon Species edited"
  	else
  		render :edit
  	end
  end

  def destroy
  	@pokemon = PokemonSpecies.find(params[:id])

  	if @pokemon.destroy
  		redirect_to pokemon_species_index_path, notice: "Pokémon Species deleted"
  	else
  		redirect_to pokemon__species_path(@pokemon), notice: "Unable to delete Pokémon Species"
  	end
  end

  private
  def pokemon_species_params
  	params.require(:pokemon_species).permit(:name, :national_dex_no, :can_be_shiny)
  end
end
