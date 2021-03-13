class LoginController < ApplicationController
  	skip_before_action :verificar_login

	# layout :login

	def index

	end

	def login
		if params[:login][:email].present? && params[:login][:senha].present?
			adms = Usuario.where(email: params[:login][:email], senha: params[:login][:senha])
			if adms.count > 0
				cookies[:netza_faleconosco] = { value: adms.first.id, expires: 1.year.from_now, httponly: true }
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
		cookies[:netza_faleconosco] = nil
	 	redirect_to "/login"
	end
end
