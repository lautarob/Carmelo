Rails.application.routes.draw do

  resources  :travels, :except => [:new,:edit] do
    collection do
      post 'search'
    end
  end

end
