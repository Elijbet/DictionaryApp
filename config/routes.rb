Rails.application.routes.draw do
  devise_for :users

  resources :words do
  	resources :definitions do 
      member do
        put "like", to: "definitions#upvote"
        put "dislike", to: "definitions#downvote"
      end
    end 
  	collection do
  		get 'all_new'
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'words#index'

end

