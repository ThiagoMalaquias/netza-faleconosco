class SituacoesController < ApplicationController
  before_action :set_situacao, only: [:show, :edit, :update, :destroy]

  # GET /situacoes
  # GET /situacoes.json
  def index
    @situacoes = Situacao.all
  end

  # GET /situacoes/1
  # GET /situacoes/1.json
  def show
  end

  # GET /situacoes/new
  def new
    @situacao = Situacao.new
  end

  # GET /situacoes/1/edit
  def edit
  end

  # POST /situacoes
  # POST /situacoes.json
  def create
    @situacao = Situacao.new(situacao_params)

    respond_to do |format|
      if @situacao.save
        format.html { redirect_to @situacao, notice: 'Situacao foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @situacao }
      else
        format.html { render :new }
        format.json { render json: @situacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /situacoes/1
  # PATCH/PUT /situacoes/1.json
  def update
    respond_to do |format|
      if @situacao.update(situacao_params)
        format.html { redirect_to @situacao, notice: 'Situacao foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @situacao }
      else
        format.html { render :edit }
        format.json { render json: @situacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situacoes/1
  # DELETE /situacoes/1.json
  def destroy
    @situacao.destroy
    respond_to do |format|
      format.html { redirect_to situacoes_url, notice: 'Situacao foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_situacao
      @situacao = Situacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def situacao_params
      params.require(:situacao).permit(:nome, :cor)
    end
end
