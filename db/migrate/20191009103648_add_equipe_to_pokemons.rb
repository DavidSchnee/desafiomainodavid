class AddEquipeToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_reference :pokemons, :equipe, foreign_key: true
  end
end
