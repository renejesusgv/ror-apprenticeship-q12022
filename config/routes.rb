Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pokemons#index'
  resources :pokemons

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end
end
