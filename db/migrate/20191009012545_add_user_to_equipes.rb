class AddUserToEquipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :equipes, :user, foreign_key: true
  end
end
