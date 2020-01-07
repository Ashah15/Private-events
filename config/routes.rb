Rails.application.routes.draw do
	root 'events#index'
  get '/signup/' ,to: 'users#new' 
  get '/login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :events
  resources :attendees, only: [:create]
end
