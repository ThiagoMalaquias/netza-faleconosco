class BatePaposController < ApplicationController
  before_action :set_bate_papo, only: [:show, :edit, :update, :destroy]

  # GET /bate_papos
  # GET /bate_papos.json
  def index
    @bate_papos = BatePapo.all
    @bate_papo = BatePapo.new
  end

  # GET /bate_papos/1
  # GET /bate_papos/1.json
  def show
  end

  # GET /bate_papos/new
  def new
    @bate_papo = BatePapo.new
  end

  # GET /bate_papos/1/edit
  def edit
  end

  # POST /bate_papos
  # POST /bate_papos.json
  def create
    @bate_papo = BatePapo.new(bate_papo_params)
    @bate_papo.usuario_id = JSON.parse(cookies[:netza_faleconosco])

    if @bate_papo.mensagem.blank?
      redirect_to bate_papos_url
      return
    end

    respond_to do |format|
      if @bate_papo.save
        format.html { redirect_to bate_papos_url, notice: 'Bate papo was successfully created.' }
        format.json { render :show, status: :created, location: @bate_papo }
      else
        format.html { render :new }
        format.json { render json: @bate_papo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bate_papos/1
  # PATCH/PUT /bate_papos/1.json
  def update
    respond_to do |format|
      if @bate_papo.update(bate_papo_params)
        format.html { redirect_to @bate_papo, notice: 'Bate papo was successfully updated.' }
        format.json { render :show, status: :ok, location: @bate_papo }
      else
        format.html { render :edit }
        format.json { render json: @bate_papo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bate_papos/1
  # DELETE /bate_papos/1.json
  def destroy
    @bate_papo.destroy
    respond_to do |format|
      format.html { redirect_to bate_papos_url, notice: 'Bate papo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bate_papo
      @bate_papo = BatePapo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bate_papo_params
      params.require(:bate_papo).permit(:usuario_id, :mensagem)
    end
end
