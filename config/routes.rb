Rails.application.routes.draw do
  devise_for :users

  resources :words do
  	resources :definitions
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'words#index'

end
