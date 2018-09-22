class ChamadosMulticlubeController < UsuarioSessaoController
  before_action :set_chamado, only: [:show, :edit, :update, :destroy, :responder, :alterar]

  # GET /chamados
  # GET /chamados.json
  def index
    @chamados = Chamado.where("chamado_id is null and usuario_id=#{usuario.id}")
    options = {page: params[:page] || 1, per_page: 10}
    if params[:busca].present?
      if params[:busca][:situacao_id].present?
        @chamados = @chamados.where("situacao_id = #{params[:busca][:situacao_id]} ")
      end
    end

    @chamados = @chamados.paginate(options)
  end

  # GET /chamados/1
  # GET /chamados/1.json
  def show
    @chamado.lido_usuario = true
    @chamado.save
  end

  # GET /chamados/new
  def new
    @chamado = Chamado.new
  end

  # GET /chamados/1/edit
  def edit
  end

  def alterar
    @chamado.situacao_id = params[:resposta][:situacao_id]
    @chamado.save!

    redirect_to "/chamados/#{@chamado.id}"
  end

  def responder
    situacao = Situacao.where(nome: "Aberto").first

    chamado_original = Chamado.find(params[:chamado_original_id])
    chamado_original.situacao_id = situacao.id
    chamado_original.lido = false
    chamado_original.save

    resposta = Chamado.new
    resposta.chamado_id = @chamado.id
    resposta.categoria_id = chamado_original.categoria_id
    resposta.assunto = chamado_original.assunto
    resposta.comentario = params[:resposta][:comentario]
    resposta.usuario_id = chamado_original.usuario_id
    resposta.situacao_id = situacao.id
    resposta.save!

    redirect_to "/chamados-multiclube/#{chamado_original.id}"
  end

  # POST /chamados
  # POST /chamados.json
  def create
    @chamado = Chamado.new(chamado_params)
    @chamado.usuario_id = usuario.id
    @chamado.situacao = Situacao.where(nome: "Aberto").first
    @chamado.lido_usuario = true

    if @chamado.save
      redirect_to "/chamados-multiclube", notice: 'Chamado was successfully created.'
    else
      render "new"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chamado
      @chamado = Chamado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chamado_params
      params.require(:chamado).permit(:categoria_id, :assunto, :comentario, :usuario_id, :administrador_id, :status, :lido, :chamado_id, :usuario_cpf, :situacao_id)
    end
end
