class ApplicationController < ActionController::Base
  before_action :verificar_login

  def verificar_login
  	unless cookies[:netza_faleconosco].present?
  		redirect_to "/login"
  	end
  end

  def administrador
  	Administrador.find(cookies[:netza_faleconosco])
  rescue
  	nil
  end
end
