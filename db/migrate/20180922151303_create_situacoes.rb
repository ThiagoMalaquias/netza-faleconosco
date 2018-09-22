class CreateSituacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :situacoes do |t|
      t.string :nome
      t.string :cor

      t.timestamps
    end
  end
end
