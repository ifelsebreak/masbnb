Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :reservations, except: [:index, :edit, :update, :show]
  end 
  get 'reservations', to: 'reservations#index'
  get 'reservations/:id', to: 'reservations#show'
  resources :reservations, only: [:destroy]
end
