class EquipesController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_equipe, only: [:show, :edit, :update, :destroy]

  def index
    @equipes = current_user.equipes
  end

  def show
    todas_equipes = Equipe.all
    @pokemons = todas_equipes.find(params[:id])
  end

  def new
    @equipe = Equipe.new
  end

  def edit
  end

  def create
    @equipe = current_user.equipes.build(equipe_params)
      if @equipe.save
        flash[:success] = "Equipe criada com sucesso!"
        redirect_to equipes_path
      else
        flash[:danger ] = "Equipe não foi criada, pois nome estava em branco!"
        redirect_to equipes_path
      end
    
  end

  def update
      if @equipe.update(equipe_params)
        flash[:success] = "Equipe editada com sucesso!"
        redirect_to equipes_path
      else
        flash[:danger ] = "Equipe não foi editada, pois nome estava em branco!"
        redirect_to equipes_path
      end
  end

  def destroy
    @equipe.destroy
    flash[:success] = "Equipe excluida com sucesso!"
    redirect_to equipes_path
  end

  private
    def set_equipe
      @equipe = current_user.equipes.find(params[:id])
    end
    def equipe_params
      params.require(:equipe).permit(:nome)
    end
end
