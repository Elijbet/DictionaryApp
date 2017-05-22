Rails.application.routes.draw do
  resources :words
  devise_for :users
  resources :definitions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'words#index'

end
