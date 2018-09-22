class ChamadosController < ApplicationController
  before_action :set_chamado, only: [:show, :edit, :update, :destroy, :responder, :alterar]

  # GET /chamados
  # GET /chamados.json
  def index
    @chamados = Chamado.where("chamado_id is null")
    options = {page: params[:page] || 1, per_page: 10}
    if params[:busca].present?
      if params[:busca][:assunto].present?
        @chamados = @chamados.where("assunto #{Sql.like} '%#{params[:busca][:assunto]}%' ")
      end

      if params[:busca][:categoria_id].present?
        @chamados = @chamados.where("categoria_id = #{params[:busca][:categoria_id]} ")
      end

      if params[:busca][:situacao_id].present?
        @chamados = @chamados.where("situacao_id = #{params[:busca][:situacao_id]} ")
      end
    end

    @chamados = @chamados.paginate(options)
  end

  # GET /chamados/1
  # GET /chamados/1.json
  def show
    @chamado.lido = true
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
    situacao = Situacao.where(nome: "Suporte respondeu").first

    chamado_original = Chamado.find(params[:chamado_original_id])
    chamado_original.situacao_id = situacao.id
    chamado_original.save

    resposta = Chamado.new
    resposta.administrador_id = administrador.id
    resposta.chamado_id = @chamado.id
    resposta.categoria_id = chamado_original.categoria_id
    resposta.assunto = chamado_original.assunto
    resposta.assunto = chamado_original.assunto
    resposta.comentario = params[:resposta][:comentario]
    resposta.usuario_id = chamado_original.usuario_id
    resposta.situacao_id = situacao.id
    resposta.save!

    redirect_to "/chamados/#{chamado_original.id}"
  end

  # POST /chamados
  # POST /chamados.json
  def create
    @chamado = Chamado.new(chamado_params)

    respond_to do |format|
      if @chamado.save
        format.html { redirect_to @chamado, notice: 'Chamado was successfully created.' }
        format.json { render :show, status: :created, location: @chamado }
      else
        format.html { render :new }
        format.json { render json: @chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chamados/1
  # PATCH/PUT /chamados/1.json
  def update
    respond_to do |format|
      if @chamado.update(chamado_params)
        format.html { redirect_to @chamado, notice: 'Chamado was successfully updated.' }
        format.json { render :show, status: :ok, location: @chamado }
      else
        format.html { render :edit }
        format.json { render json: @chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chamados/1
  # DELETE /chamados/1.json
  def destroy
    @chamado.destroy
    respond_to do |format|
      format.html { redirect_to chamados_url, notice: 'Chamado was successfully destroyed.' }
      format.json { head :no_content }
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
