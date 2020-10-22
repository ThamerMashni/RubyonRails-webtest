Rails.application.routes.draw do

  namespace :admin do

    root to: 'users#index'
    resources :users, unless:[:new, :create]  do
      member do 
        get 'users/:id', to: 'users#show' 
      end

    end
    #get 'users', to:'admins#users'
    #get '/users/:id', :to => 'users#index', :as => :user
  end
  resources :users, only:[:new,:create] , path: '/users'
  resources :users, unless:[:new,:create], module: 'admin'

  resources :sessions, only: [:new, :create, :destroy]  
  
  resources :users , only: [:new,:create]  

  get 'signup', to: 'users#new', as: 'signup' 

  
  #post '/users', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout' 
   


  get 'page/index'   
  root 'page#index' 

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # resources :users
  # get 'page/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
