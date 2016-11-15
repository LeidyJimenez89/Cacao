class Admin::SublotsController < ApplicationController
  before_action :set_sublot, only: [:show, :edit, :update, :destroy]

  # GET /sublots
  # GET /sublots.json
  def index
    @sublots = Sublot.all
  end

  # GET /sublots/1
  # GET /sublots/1.json
  def show
  end

  # GET /sublots/new
  def new
    @sublot = Sublot.new
  end

  # GET /sublots/1/edit
  def edit
  end


  def create
    @sublot = Sublot.new(sublot_params)
      if @sublot.save
        redirect_to admin_sublots_path, notice: 'Sublote creado satisfactoriamente'
      else
        render :new , alert: 'Sublote no creado satisfactoriamente'
      end
  end


  # PATCH/PUT /sublots/1
  # PATCH/PUT /sublots/1.json
  def update
    respond_to do |format|
      if @sublot.update(sublot_params)
        format.html { redirect_to admin_sublots_path, notice: 'Sublote editado satisfactoriamente' }
      else
        render :edit , alert: 'Sublote no creado satisfactoriamente' 
      end
    end
  end

  # DELETE /sublots/1
  # DELETE /sublots/1.json
  def destroy
    @sublot.destroy
    respond_to do |format|
      format.html { redirect_to admin_sublots_path, notice: 'Sublote eliminado satisfactoriamente' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sublot
      @sublot = Sublot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sublot_params
      params.require(:sublot).permit(:user_id, :name, :description, :code, :costc_id)
    end
end