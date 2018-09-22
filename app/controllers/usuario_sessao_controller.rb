class UsuarioSessaoController < ActionController::Base
  layout 'multiclube'
  before_action :verificar_usuario_login

  def verificar_usuario_login
  	unless cookies[:usuario_multiclube].present?
  		redirect_to "/multiclube"
  	end
    
    if @usuario.blank?
      @usuario = usuario
    end
  end

  def usuario
    return @usuario if @usuario.present?
  	@usuario = Usuario.find(cookies[:usuario_multiclube])
    @usuario
  rescue
  	nil
  end
end
