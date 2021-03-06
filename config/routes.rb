Rails.application.routes.draw do
  devise_for :users
  root to: 'pokemons#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pokemons do 
    resources :bookings, only: [:create, :update, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :bookings, only: [:create, :update, :destroy]
  end
end
