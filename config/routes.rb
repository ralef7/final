Rails.application.routes.draw do

  root 'users#index'

  post '/follows' => 'follows#create'

  post '/comments/:post_id' => 'comments#create'
  delete '/comments/:id' => 'comments#delete'

  post '/posts' => 'posts#create'
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  get '/posts/:id' => 'posts#show'

  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/account' => 'users#show'

  resources :users
  resources :blogs
 
end
