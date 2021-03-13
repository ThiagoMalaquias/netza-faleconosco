class CreateBatePapos < ActiveRecord::Migration[5.0]
  def change
    create_table :bate_papos do |t|
      t.references :usuario, foreign_key: true
      t.text :mensagem

      t.timestamps
    end
  end
end
