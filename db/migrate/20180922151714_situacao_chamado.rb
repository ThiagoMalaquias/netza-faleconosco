class SituacaoChamado < ActiveRecord::Migration[5.0]
  def change
  	add_reference :chamados, :situacao, index: true
  end
end
