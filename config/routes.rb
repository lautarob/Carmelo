Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  resources :users
  resources  :travels, :except => [:new,:edit] do
    collection do
      post 'search', to: 'travels#search'
      post 'create', to: 'travels#create'
      delete 'delete/:id', to: 'travels#destroy'
      put 'update', to: 'travels#update'
      get 'show/:id', to: 'travels#show'
    end
  end

  root to: 'static_pages#home'
  match '/login', to: 'static_pages#login', via: 'get'
  match '/register', to: 'static_pages#register', via: 'get'
  match '/user/offer', to: 'user_pages#offer', via: 'get'
  match '/user/search', to: 'user_pages#search', via: 'get'
end
