Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :users
  resources :travels, :except => [:new,:edit] do
    collection do
      # post 'search', to: 'travels#search'
      get 'search', to: 'travels#search'
      get 'offered', to: 'travels#offered'
    end
  end

  root to: 'static_pages#home'
  match '/login', to: 'static_pages#login', via: 'get'
  match '/register', to: 'static_pages#register', via: 'get'
end
