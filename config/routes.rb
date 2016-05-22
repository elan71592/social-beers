Rails.application.routes.draw do
  get '/' => 'index#index'
  get '/login' => 'session#login'
  post '/login' => 'session#try_login'
  get '/users/new' => 'session#new'
  get '/logout' => 'session#logout'
  resources :search
  resources :tweets
end
