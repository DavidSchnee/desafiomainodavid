class CreateEquipes < ActiveRecord::Migration[5.2]
  def change
    create_table :equipes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
