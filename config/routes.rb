Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources  :travels, :except => [:new,:edit] do
    collection do
      post 'search'
    end
  end

  root to: 'static_pages#home'
  match '/user/offer', to: 'user_pages#offer', via: 'get'
end
