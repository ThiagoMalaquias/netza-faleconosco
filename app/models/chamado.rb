class Chamado < ApplicationRecord
  belongs_to :categoria
  belongs_to :usuario
  belongs_to :situacao

  attr_accessor :usuario_cpf

  validate :usuario_id, :presence

  before_validation :verifica_usuario_cpf

  def verifica_usuario_cpf
    if self.usuario_cpf.present?
      self.usuario_cpf = self.usuario_cpf.gsub(/\.|-/, '')
      usuarios = Usuario.where(cpf: self.usuario_cpf)
      if usuarios.count > 0
        usuario = usuarios.first
      else
        usuario = Usuario.create(nome: self.usuario_cpf, cpf: self.usuario_cpf)
      end

      self.usuario_id = usuario.id
    end
  end

  def perguntas_respostas
    return @perguntas_respostas if @perguntas_respostas.present?

    @perguntas_respostas = [self]
    carrega_perguntas_respostas(self)
    @perguntas_respostas
  end

  def carrega_perguntas_respostas(chamado)
    chamado = Chamado.where(chamado_id: chamado.id).first
    if chamado.present?
      @perguntas_respostas << chamado
      carrega_perguntas_respostas(chamado)
    end
  rescue;end
end
