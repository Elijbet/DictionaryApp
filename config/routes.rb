Rails.application.routes.draw do
  devise_for :users

  resources :words do
  	resources :definitions
  	collection do
  		get 'all_new'
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'words#index'

end
