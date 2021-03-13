Rails.application.routes.draw do
  
  resources :usuarios
  resources :bate_papos
  resources :situacoes
  resources :status
  resources :categorias
  resources :chamados
  resources :administradores
  root to: 'chamados#index'

  # get "/admin" => redirect("/")
  get '/login', to: 'login#index'
  post '/login/on', to: 'login#login'
  get '/deslogar', to: 'login#logout'

  post '/chamados/:id/alterar', to: 'chamados#alterar'
  post '/chamados/:id/responder', to: 'chamados#responder'

  get '/multiclube', to: 'multiclube#index'
  post '/chamados-multiclube', to: 'chamados_multiclube#create'
  get '/chamados-multiclube', to: 'chamados_multiclube#index'
  get '/chamados-multiclube/novo', to: 'chamados_multiclube#new'
  get '/chamados-multiclube/:id', to: 'chamados_multiclube#show'
  post '/chamados-multiclube/:id/responder', to: 'chamados_multiclube#responder'

end
