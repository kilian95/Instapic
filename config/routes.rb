Rails.application.routes.draw do

  root "pins#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :pins do
    resources :comments
  	member do
  		put "like",    to: "pins#upvote"
  	end
  end
  resources :users do
  	member do
  		get :posts, :following, :followers
  	end
  end 
  resources :relationships, only: [:create, :destroy]
  
end

