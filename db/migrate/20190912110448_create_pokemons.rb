class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :national_dex_no
      t.boolean :can_be_shiny?

      t.timestamps
    end
  end
end
