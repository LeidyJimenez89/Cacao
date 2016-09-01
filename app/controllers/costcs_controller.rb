class CostcsController < ApplicationController
  before_action :set_costc, only: [:show, :edit, :update, :destroy]

  # GET /costcs
  # GET /costcs.json
  def index
    @costcs = Costc.all
  end

  # GET /costcs/1
  # GET /costcs/1.json
  def show
  end

  # GET /costcs/new
  def new
    @costc = Costc.new
  end

  # GET /costcs/1/edit
  def edit
  end

  # POST /costcs
  # POST /costcs.json
  def create
    @costc = Costc.new(costc_params)
    if @costc.save

      params[:costc][:labors].each do |labor|
        if labor.present?
          nuevo = LaborCostc.new
          nuevo[:labor_id] = labor
          nuevo[:costc_id] = @costc.id
          nuevo.save
        end
      end
      
      redirect_to costcs_path, notice: 'Centro de costos creado satisfactoriamente' 
    else
      render :new , alert:'Centro de costos no creado satisfactoriamente'
    end
  end

  # PATCH/PUT /costcs/1
  # PATCH/PUT /costcs/1.json
  def update
    respond_to do |format|
      if @costc.update(costc_params)
        format.html { redirect_to costcs_path, notice: 'Centro de costos editado satisfactoriamente' }
      else
        render :edit , alert: 'Centro de costos editado satisfactoriamente'
      end
    end
  end

  # DELETE /costcs/1
  # DELETE /costcs/1.json
  def destroy
    @costc.destroy
    respond_to do |format|
      format.html { redirect_to costcs_path, notice: 'Centro de costos eliminado satisfactoriamente' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costc
      @costc = Costc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def costc_params
      params.require(:costc).permit(:user_id, :code, :name, :description)
    end
end
