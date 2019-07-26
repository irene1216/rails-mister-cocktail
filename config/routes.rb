Rails.application.routes.draw do
  root to: 'cocktails#index'
  get '/cocktails/randomizer', to: 'cocktails#randomizer'
  post '/cocktails/randomizer', to: 'cocktails#create'
  resources :doses, only: [:destroy]
  resources :cocktails, only: [ :new, :create, :index, :show, :update, :edit ] do
    resources :doses, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
