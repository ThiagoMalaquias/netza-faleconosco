class CreateChamados < ActiveRecord::Migration[5.0]
  def change
    create_table :chamados do |t|
      t.references :categoria, foreign_key: true
      t.string :assunto
      t.text :comentario
      t.integer :usuario_id
      t.integer :administrador_id
      t.boolean :lido
      t.integer :chamado_id

      t.timestamps
    end
  end
end
