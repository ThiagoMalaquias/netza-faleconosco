Rails.application.routes.draw do
  
  resources :situacoes
  resources :status
  resources :categorias
  resources :usuarios
  resources :chamados
  resources :administradores
  root to: 'chamados#index'

  # get "/admin" => redirect("/")
  get '/login', to: 'login#index'
  post '/login/on', to: 'login#login'
  get '/deslogar', to: 'login#logout'

  post '/chamados/:id/responder', to: 'chamados#responder'

end
