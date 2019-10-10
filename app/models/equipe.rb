class Equipe < ApplicationRecord
    validates :nome, presence: true, length: {maximum:50}
    belongs_to :user
    has_many :pokemons
    validates_length_of :pokemons, maximum: 5
end
