Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users
  resources :travels, :except => [:new,:edit] do
    collection do
      get 'search', to: 'travels#search'
      get 'offer', to: 'travels#offer'
    end
  end

  root to: 'static_pages#home'
  match '/login', to: 'static_pages#login', via: 'get'
  match '/register', to: 'static_pages#register', via: 'get'
end
