Rails.application.routes.draw do

  root 'users#index'

  post '/follows' => 'follows#create'
  delete '/follows/:id' => 'follows#delete'


  post '/comments/:post_id' => 'comments#create'
  delete '/comments/:id' => 'comments#delete'
  get 'comments/:id/edit' => 'comments#edit'
  patch '/comments/:id' => 'comments#update'


  delete '/posts/:id' => 'posts#delete'
  post '/posts' => 'posts#create'
  patch '/posts/:id' => 'posts#update'
  get "/posts/:id/edit" => 'posts#edit'
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
