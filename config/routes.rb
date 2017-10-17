Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :home, only: [:index] 
resources :users, only: [:index, :new, :create, :makerelation] 
  
get '/sessions/login', to: 'sessions#new', as: :login
post '/sessions/login', to: 'sessions#create', as: nil
delete '/sessions/logout', to: 'sessions#destroy', as: :logout

end
