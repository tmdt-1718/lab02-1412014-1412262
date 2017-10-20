Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :home, only: [:index] 

post '/users/request', to: "users#getrequest" , as: :request_user
get 'users/requests', to: "users#requestsindex", as: :requests
get 'users/friends', to: "users#listfriends", as: :friends
get 'users/acceptrequest/:id', to: "users#acceptrequest", as: :acceptrequest
resources :users, only: [:index, :new, :create, :makerelation] 

get '/messages/receive', to: 'messages#receivefrom', as: :receivefrom
get '/messages/receive/:id', to: 'messages#showreceivefrom', as: :showreceivefrom
get '/messages/send', to: 'messages#sendto', as: :sendto
get '/messages/send/:id', to: 'messages#showsendto', as: :showsendto
resources :messages, only: [:index, :new, :create, :show]


get '/sessions/login', to: 'sessions#new', as: :login
post '/sessions/login', to: 'sessions#create', as: nil
delete '/sessions/logout', to: 'sessions#destroy', as: :logout

end
