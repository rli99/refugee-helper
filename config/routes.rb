Rails.application.routes.draw do

  root 'pages#home'       
  get 'health' => 'pages#health'
  get 'shelter' => 'pages#shelter'
  get 'food' => 'pages#food'
  get 'family' => 'pages#family'
  get 'education' => 'pages#education'
  get 'career' => 'pages#career'
  
  get '/login'=>'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  resources :questions, only: [:show, :new, :create, :show]

  get '/profile' => 'users#profile'
  post '/profile' => 'users#update'

  resources :answers, only: [:create]
  
  get 'report' => 'answers#report'
  get 'unreport' => 'answers#unreport'
  get 'like' => 'answers#like'
  get 'unlike' => 'answers#unlike'
  get 'confirmation' => 'questions#showticket'
  get 'donate' => 'pages#donate'
  get 'answered' => 'pages#answered'

  get 'services' => 'pages#services'

  get 'search' => 'questions#search'

end
