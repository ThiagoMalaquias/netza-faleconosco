class AddSenhaToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :senha, :string
  end
end
