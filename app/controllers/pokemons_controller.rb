class PokemonsController < ApplicationController
  def index
  	@pokemons = Pokemon.all.order(:national_dex_no)
  end

  def show
  	@pokemon = Pokemon.find(params[:id])
  end

  def new
  	@pokemon = Pokemon.new
  end

  def create
  	@pokemon = Pokemon.new
  	@pokemon.assign_attributes(pokemon_params)

  	if @pokemon.save
  		redirect_to pokemon_path(@pokemon), notice: "Pokémon created"
  	else
  		render :new
  	end
  end

  def edit
  	@pokemon = Pokemon.find(params[:id])
  end

  def update
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.assign_attributes(pokemon_params)
  	if @pokemon.save
  		redirect_to pokemon_path(@pokemon), notice: "Pokémon edited"
  	else
  		render :edit
  	end
  end

  def destroy
  	@pokemon = Pokemon.find(params[:id])

  	if @pokemon.destroy
  		redirect_to pokemons_path, notice: "Pokémon deleted"
  	else
  		redirect_to pokemon_path(@pokemon), notice: "Unable to delete Pokémon"
  	end
  end

  private
  def pokemon_params
  	params.require(:pokemon).permit(:name, :national_dex_no, :can_be_shiny?)
  end
end
