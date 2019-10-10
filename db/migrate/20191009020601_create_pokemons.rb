class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :nome
      t.string :tipo
      t.string :sprite

      t.timestamps
    end
  end
end
