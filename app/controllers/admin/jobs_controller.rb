class Admin::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  def enable
    @job = Job.find(params[:id])
    @job[:state] = "Activo"
    if @job.save
      redirect_to admin_jobs_path, notice: 'Estado habilitado satisfactoriamente'
    else
      render :new , alert: 'Estado no habilitado satisfactoriamente' 
    end
  end

  def disable
    @job = Job.find(params[:id])
    @job[:state] = "Inactivo"
    if @job.save
      redirect_to admin_jobs_path, notice: 'Estado inhabilitado satisfactoriamente'
    else
      render :new , alert: 'Estado no inhabilitado satisfactoriamente' 
    end
  end


  def create
    @job = Job.new(job_params)
    @job.state="Activo"
    if @job.save

      params[:job][:labors2].each do |labor|
        if labor.present?
          nuevo = LaborJob.new
          nuevo[:labor_id] = labor
          nuevo[:job_id] = @job.id
          nuevo.save
        end
      end

      redirect_to admin_jobs_path, notice: 'C1argo creado satisfactoriamente'
    else
      render :new , alert: 'Cargo no creado satisfactoriamente' 
    end
  end


  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if @job.labors.present?
      @job = Job.find(params[:id])
      @job.labors.delete_all
    end

    params[:job][:labors2].each do |labor|
      if labor.present?
        nuevo = LaborJob.new
        nuevo[:labor_id] = labor
        nuevo[:job_id] = @job.id
        nuevo.save
      end
    end
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to admin_jobs_path, notice: 'Cargo editado satisfactoriamente' }
      else
        render :edit , alert: 'Cargo no creado satisfactoriamente' 
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to admin_jobs_path, notice: 'Cargo eliminado satisfactoriamente' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:user_id, :name, :description, :basepay)
    end
end
