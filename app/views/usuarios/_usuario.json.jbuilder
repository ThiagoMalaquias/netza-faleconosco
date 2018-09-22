json.extract! usuario, :id, :nome, :cpf, :email, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
