Rails.application.routes.draw do
  devise_for :users
  resources :recipes

  root "recipes#index"

  resources :categories, except: [:destroy]




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
