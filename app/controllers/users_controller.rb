class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Treinador cadastrado com sucesso!"
            redirect_to root_url
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if current_user.update(user_params)
          flash[:success] = 'Dados atualizados com sucesso'
          redirect_to user_path
        else
          render 'edit'
        end
      end
    private
    def user_params
        params.require(:user).permit(:nome,:foto,:email,:idade,:sexo,:password,:password_confirmation )
    end
end
