class ChangeNotNullForPokemon < ActiveRecord::Migration[5.2]
  def change
    change_column :pokemons, :nome, :string , default: "", null: false
    change_column :pokemons, :tipo, :string , default: "", null: false
    change_column :pokemons, :sprite, :string , default: "", null: false
  end
end
