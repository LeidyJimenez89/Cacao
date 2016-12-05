class Admin::OperatorsController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]

  # GET /operators
  # GET /operators.json
  def index
    @operators = Operator.all
  end

  def savehistory
    @records = Record.all
  end

  def paysheet
    if params[:fromdate] == 0
      params[:fromdate] = Date.now
      params[:todate]   = Date.now
      params[:companytype]   = "Todos"
    end

    @operator    = Operator.new
    @supervisors = Supervisor.all

    #transcriptions = Transcription.where("registerdate > '" + params[:from_date].to_s + "' AND registerdate < '" + params[:to_date].to_s + " 23:59:59'" + "' AND transcription.operator.company_id == < '" + params[:companytype] )
    transcriptions = Transcription.where(registerdate: params[:fromdate].to_s + " 00:00:00" .. params[:todate].to_s + "23:59:59" )
    #log(Transcription.where(registerdate: params[:from_date].to_s + " 00:00:00" .. params[:to_date].to_s + " 23:59:59" ).to_sql)
    log(transcriptions)
    @operators   = Hash.new
    transcriptions.each do |t|
      log(t.operator.company_id)
      log(params[:companytype])
      if t.operator.company_id== params[:companytype].to_i
        @operators[t.operator_id] = t.operator
      end
    end

    @configs = Config.first
  end

  def paysheet_post
    redirect_to admin_operators_paysheet_path(params[:operator][:fromdate],params[:operator][:todate], params[:operator][:companytype])
  end

  # GET /operators/1
  # GET /operators/1.json
  def show
  end

  # GET /operators/new
  def new
    @operator = Operator.new
  end

  def create
    @operator = Operator.new(operator_params)
    @operator[:state] = "Activo"
    @operator[:flag] = 1

    if @operator.save

      nuevo = Record.new
      nuevo[:operator_id] = @operator.id
      nuevo[:state] = @operator.state
      nuevo[:dateadmission] = @operator.dateadmission
      nuevo.save

      params[:operator][:jobs2].each do |job|
        if job.present?
          jobforoperator = JobOperator.new
          jobforoperator[:job_id] = job
          jobforoperator[:operator_id] = @operator.id
          jobforoperator.save

          jobrecord = RecordJob.new
          jobrecord[:operator_id] = @operator.id
          jobrecord[:job_id] = job
          jobrecord[:changejobdate] = @operator.dateadmission
          jobrecord.save
        end
      end

      redirect_to admin_operators_path, notice: 'Operador creado satisfactoriamente'
    else
      render :new , alert: 'Operador no creado satisfactoriamente' 
    end
  end

  # GET /operators/1/edit
  def edit
  end

  def update

    if @operator.jobs.present?
      @operator = Operator.find(params[:id])
      @operator.jobs.delete_all
    end

    params[:operator][:jobs2].each do |job|
      if job.present?
        jobforoperator = JobOperator.new
        jobforoperator[:job_id] = job
        jobforoperator[:operator_id] = @operator.id
        jobforoperator.save
      end
    end

    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to admin_operators_path, notice: 'Operador editado satisfactoriamente' }
      else
        render :edit , alert: 'Operador no editado satisfactoriamente' 
      end
    end
  end

#  def activate
#    @operator = Operator.find(params[:id])
#  end

#  def enable
#    @operator = Operator.find(params[:id])
#    @operator[:state] = "Activo"
#    if @operator.update(operator_params)
#      redirect_to admin_operators_path, notice: 'Estado habilitado satisfactoriamente'
#    else
#      render :activate , alert: 'Estado no habilitado satisfactoriamente' 
#    end
#  end

  def retire
    @record = Record.new
  end

  def retired
    @operator = Operator.find(params[:id])
    @operator[:state] = "Retirado"

    if @operator.save

      nuevo = Record.new
      nuevo[:operator_id] = @operator.id
      nuevo[:state] = "Retirado"
      nuevo[:description] = params[:record][:description]
      nuevo[:retirementdate] = params[:record][:retirementdate]
      nuevo.save

      redirect_to admin_operators_path, notice: 'Persona retirada satisfactoriamente'
    else
      render :retire , alert: 'Persona no retirada satisfactoriamente' 
    end
  end

  def reinstate
    @record = Record.new
  end

  def reinstated
    @operator = Operator.find(params[:id])
    @operator[:state] = "Reintegrado"

    if @operator.save

      nuevo = Record.new
      nuevo[:operator_id] = @operator.id
      nuevo[:state] = "Reintegrado"
      nuevo[:description] = params[:record][:description]
      nuevo[:reinstatedate] = params[:record][:reinstatedate]
      nuevo.save

      redirect_to admin_operators_path, notice: 'Persona ingresada satisfactoriamente'
    else
      render :reinstate , alert: 'Persona no ingresada satisfactoriamente' 
    end
  end

  def changejob
      @recordJob = RecordJob.new
      @operator = Operator.where(id: params[:id]).first
  end

  def changedjob
    @operator = Operator.where(id: params[:id]).first

    if @operator.jobs.present?
      @operator.jobs.delete_all
    end

    params[:record_job][:jobs2].each do |job|
      if job.present?
        jobforoperator = JobOperator.new
        jobforoperator[:job_id] = job
        jobforoperator[:operator_id] = @operator.id
        jobforoperator.save
      end
    end

    params[:record_job][:jobs2].each do |job|
      if job.present?
        jobrecord = RecordJob.new
        jobrecord[:operator_id] = @operator.id
        jobrecord[:job_id] = job
        jobrecord[:changejobdate] = params[:record_job][:changejobdate]
        jobrecord[:description] = params[:record_job][:description]
        jobrecord.save
      end
    end

    redirect_to admin_operators_path, notice: 'Cargo cambiado satisfactoriamente'
  end

  def destroy
    @operator = Operator.where(id: params[:id]).first

    if @operator.transcriptions.present?      
      respond_to do |format|
        format.html { redirect_to admin_operators_path, alert: 'Este operador no se puede eliminar, tiene registros en el sistema' }
      end
    else
      @operator[:flag] = 0
      @operator.save
      respond_to do |format|
        format.html { redirect_to admin_operators_path, notice: 'Operador eliminado satisfactoriamente' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator
      @operator = Operator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_params
      params.require(:operator).permit(:cc, :name, :position, :dateadmission, :state , :job_id, :lastname, :retirementdate, :description, :gender, :transportAllowance, :feedingAllowance, :vehicleAllowance, :housingAllowance, :childrenLicenseSince, :childrenLicenseUntil, :sanction, :flag, :costcenter, :basepay, :company_id)
    end
end
