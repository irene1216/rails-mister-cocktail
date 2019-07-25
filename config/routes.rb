Rails.application.routes.draw do

  get 'cocktails', to: 'cocktails#index'
  resources :doses, only: [:destroy]
  resources :cocktails, only: [ :new, :create, :index, :show ] do
    resources :doses, only: [ :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
