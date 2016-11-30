class Admin::LaborsController < ApplicationController
  before_action :set_labor, only: [:show, :edit, :update, :destroy]

  # GET /labors
  # GET /labors.json
  def index
    @labors = Labor.all
  end

  # GET /labors/1
  # GET /labors/1.json
  def show
  end

  # GET /labors/new
  def new
    @labor = Labor.new
  end

  # GET /labors/1/edit
  def edit
  end

  # POST /labors
  # POST /labors.json
  def create
    @labor = Labor.new(labor_params)
    if @labor.save

      params[:labor][:costcs2].each do |cc|
        if cc.present?
          nuevo = LaborCostc.new
          nuevo[:costc_id] = cc
          nuevo[:labor_id] = @labor.id
          nuevo.save
        end
      end

      redirect_to admin_labors_path, notice: 'Labor creada satisfactoriamente' 
    else
      render :new , alert: 'Labor no creada satisfactoriamente' 
    end
  end

  # PATCH/PUT /labors/1
  # PATCH/PUT /labors/1.json
  def update
    if @labor.costcs.present?
      @labor = Labor.find(params[:id])
      @labor.costcs.delete_all
    end

    params[:labor][:costcs2].each do |cc|
      if cc.present?
        nuevo = LaborCostc.new
        nuevo[:costc_id] = cc
        nuevo[:labor_id] = @labor.id
        nuevo.save
      end
    end

    respond_to do |format|
      if @labor.update(labor_params)
        format.html { redirect_to admin_labors_path, notice: 'Labor editada satisfactoriamente' }
      else
        render :edit , alert: 'Labor editada satisfactoriamente'
      end
    end
  end

  # DELETE /labors/1
  # DELETE /labors/1.json
  def destroy
    @labor.destroy
    respond_to do |format|
      format.html { redirect_to admin_labors_path, notice: 'Labor eliminada satisfactoriamente' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labor
      @labor = Labor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def labor_params
      params[:labor][:name]=params[:labor][:name].capitalize
      params.require(:labor).permit(:user_id, :code, :name, :paymentunit, :rate, :assistance)
    end
end
