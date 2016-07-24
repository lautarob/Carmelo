Rails.application.routes.draw do

  root to: 'static_pages#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users
  resources :travels, :except => [:new,:edit] do
    collection do
      get 'search', to: 'travels#search'
      get 'offer', to: 'travels#offer'
    end
  end

  match '/login', to: 'static_pages#login', via: 'get'
  match '/register', to: 'static_pages#register', via: 'get'
end
