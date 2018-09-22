class LidoUsuario < ActiveRecord::Migration[5.0]
  def change
  	add_column :chamados, :lido_usuario, :boolean
  end
end
