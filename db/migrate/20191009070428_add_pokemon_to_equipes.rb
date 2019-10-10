class AddPokemonToEquipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :equipes, :pokemon, foreign_key: true
  end
end
