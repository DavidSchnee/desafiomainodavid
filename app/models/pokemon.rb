class Pokemon < ApplicationRecord
    belongs_to :equipe
    validates_associated :equipe
    validates :nome, presence: true
end
