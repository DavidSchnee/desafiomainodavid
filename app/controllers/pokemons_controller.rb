class PokemonsController < ApplicationController
    before_action :require_logged_in_user
    def new
        @pokemon = Pokemon.new
        @equipes = current_user.equipes
    end
    def destroy
        Pokemon.destroy(params[:id])
        flash[:success] = "Pokemon exlcuido com sucesso!"
        redirect_to equipes_path
      end
    def create
            nome = params.require(:pokemon).permit(:nome,:equipe_id)
            begin
              response = RestClient::Request.execute(method: :get, url: "https://pokeapi.co/api/v2/pokemon/#{nome["nome"].downcase}",timeout: 10)
              response_json = JSON.parse(response.body)
              json = response_json
              @pokemon = Pokemon.new pokemon_params 
              @pokemon.nome = json['species']['name']
              @pokemon.sprite = json['sprites']['front_default']
              @pokemon.tipo = json['types'][0]['type']['name']
              @equipe_nome = @pokemon.equipe.id
             
            if @pokemon.save
              flash[:success] = "Pokemon Adicionado com sucesso"
            redirect_to equipes_path
            else
              flash[:danger] = "Você atigiu o limite de 6 pokemons nesta equipe"
              redirect_to new_pokemon_path
            end
            rescue RestClient::ExceptionWithResponse => e
              flash[:danger] = "Pokemon não foi encontrado! (erro:#{e})"
              redirect_to new_pokemon_path
            rescue NoMethodError => e 
              flash[:danger] = "O nome do Pokemom não pode estar em branco!"
              redirect_to new_pokemon_path
            end
           
    end
   


    private
        def pokemon_params
            params.require(:pokemon).permit(:nome, :equipe_id)
        end
end
