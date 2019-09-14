class RenameCanBeShinyForPokemon < ActiveRecord::Migration[6.0]
  def self.up
  	rename_column :pokemons, :can_be_shiny?, :can_be_shiny
  end

  def self.down
  	rename_column :pokemons, :can_be_shiny, :can_be_shiny?
  end
end
