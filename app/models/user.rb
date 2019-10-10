class User < ApplicationRecord
    has_secure_password

    validates :nome, presence: true, length:{ minimum:4}
    validates :password, presence: true, length:{minimum:6}
    validates :foto, presence: true,length:{minimum:10}
    validates :idade, presence: true, numericality: { less_than:120}  
    validates :sexo, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                                      format: { with: VALID_EMAIL_REGEX },
                                      uniqueness: { case_sensitive: true }
    has_many :equipes
end
