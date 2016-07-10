Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users
  resources  :travels, :except => [:new,:edit] do
    collection do
      post 'search'
    end
  end

end
