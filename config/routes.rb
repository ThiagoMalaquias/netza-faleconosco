Rails.application.routes.draw do
  
  resources :administradores
  root to: 'administradores#index'

  # get "/admin" => redirect("/")
  get '/login', to: 'login#index'
  post '/login/on', to: 'login#login'
  get '/deslogar', to: 'login#logout'
end
