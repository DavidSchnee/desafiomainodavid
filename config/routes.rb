Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sobre', to: "static_pages#sobre"
  get 'contato', to: "static_pages#contato"
  get 'entrar', to:'sessions#new'
  post 'entrar', to:'sessions#create'
  delete 'sair', to: 'sessions#destroy'
  resources :users, only: [:new,:create,:show,:edit,:update]
  resources :equipes
  resources :pokemons, only:[:new,:create,:destroy]
  root to: "static_pages#index"
end
