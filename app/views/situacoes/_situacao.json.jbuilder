json.extract! situacao, :id, :nome, :cor, :created_at, :updated_at
json.url situacao_url(situacao, format: :json)
