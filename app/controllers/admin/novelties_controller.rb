class Admin::NoveltiesController < ApplicationController
  before_action :set_novelty, only: [:show, :edit, :update, :destroy]

  def index
    @novelties = Novelty.all
  end

  # GET /operators/new
  def new
    @novelty = Novelty.new
  end

  def create
    @novelty = Novelty.new(novelty_params)

    if @novelty.labor.paymentunit == "Jornal"
      @novelty[:subtotal]= params[:novelty][:wageamount].to_f * @novelty.labor.rate.to_f
    else
      @novelty[:subtotal]= params[:novelty][:laboramount].to_f * @novelty.labor.rate.to_f
    end

    if @novelty.save
      redirect_to admin_novelties_path, notice: 'Registro guardado'
    else
      render :new , alert: 'Registro no esta guardado' 
    end
  end

  def edit
    @novelty = Novelty.find(params[:id])
  end

  def update
    @novelty = Novelty.find(params[:id])

    if @novelty.update(novelty_params)

      if @novelty.labor.paymentunit == "Jornal"
        @novelty[:subtotal]= params[:novelty][:wageamount].to_f * @novelty.labor.rate.to_f
      else
        @novelty[:subtotal]= params[:novelty][:laboramount].to_f * @novelty.labor.rate.to_f
      end
      @novelty.save

      redirect_to admin_novelties_path, notice: 'Registro editado'
    else
      render :new , alert: 'Registro no esta editado' 
    end
  end

  def destroy
    @novelty = Novelty.find(params[:id])
    @novelty.destroy
 
    redirect_to admin_novelties_path
  end

  def get_employeejobs
    op = Supervisor.where(id: params[:supervisorId]).first
    jobs = Array.new

    if op.present?
      jobs = op.jobs.map { |e| { value: e.id, text: e.name } }
    end

    respond_to do |format|
      format.html { render :json => "Hola mundo" }
      format.json { render :json => jobs }
    end
  end

  def get_employeelabors
    op = Job.where(id: params[:jobId]).first
    labors = Array.new

    if op.present?
      labors = op.labors.map { |e| { value: e.id, text: e.code + " " + e.name } }
    end

    respond_to do |format|
      format.html { render :json => "Hola mundo" }
      format.json { render :json => labors }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novelty
      @novelty = Novelty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def novelty_params
      params.require(:novelty).permit(:supervisor_id, :labor_id, :wageamount, :laboramount, :area)
    end
end
