Rails.application.routes.draw do
  get 'relationships_controller/create'

  get 'relationships_controller/destroy'

  get 'microposts/create'

  get 'microposts/destroy'

  get 'users/new'

  #get 'static_pages/home'

  #get 'static_pages/help'

  #get "static_pages/about"

  #get "static_pages/contact"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  root 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
