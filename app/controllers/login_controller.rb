class LoginController < ApplicationController
  	skip_before_action :verificar_login

	# layout :login

	def index

	end

	def login
		if params[:email].present? && params[:senha].present?
			adms = Administrador.where(email: params[:email], senha: params[:senha])
			if adms.count > 0
				cookies[:producao_admin] = { value: adms.first.id, expires: 1.year.from_now, httponly: true }
				redirect_to "/"
			else
				flash[:error] = "Login e senha inválidos"
				redirect_to "/login"
			end
		else
			flash[:error] = "Login e senha inválidos"
			redirect_to "/login"
		end
	end

	def logout
		cookies[:producao_admin] = nil
	 	redirect_to "/login"
	end
end
