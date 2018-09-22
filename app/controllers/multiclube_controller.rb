class MulticlubeController < ActionController::Base
  layout 'multiclube_logout'
  def index
    if params[:cpf].present?
      usuarios = Usuario.where(cpf: params[:cpf])
      if usuarios.count > 0
        usuario = usuarios.first
      else
        usuario = Usuario.create(nome: params[:nome], cpf: params[:cpf], email: params[:email], telefone: params[:telefone])
      end

      cookies[:usuario_multiclube] = { value: usuario.id, expires: 1.day.from_now, httponly: true }
      redirect_to "/chamados-multiclube"
    end
  end
end
