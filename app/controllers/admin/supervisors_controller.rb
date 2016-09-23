class Admin::SupervisorsController < ApplicationController
  before_action :set_supervisor, only: [:show, :edit, :update, :destroy]

  # GET /supervisors
  # GET /supervisors.json
  def index
    @supervisors = Supervisor.all
  end

  def savehistory
    @records = Record.all
  end

  def show
  end

  def new
    @supervisor = Supervisor.new
  end

  def create
    @supervisor = Supervisor.new(supervisor_params)
    @supervisor[:state] = "Activo"

    if @supervisor.save

      params[:supervisor][:operators2].each do |operator|
        if operator.present?
          nuevo = OperatorSupervisor.new
          nuevo[:operator_id] = operator
          nuevo[:supervisor_id] = @supervisor.id
          nuevo.save
        end
      end

      nuevo = Record.new
      nuevo[:supervisor_id] = @supervisor.id
      nuevo[:state] = @supervisor.state
      nuevo[:dateadmission] = @supervisor.dateadmission
      nuevo.save

      redirect_to admin_supervisors_path, notice: 'Supervisor creado satisfactoriamente'
    else
      render :new , alert: 'Operador no creado satisfactoriamente' 
    end
  end

  def edit
  end

  def update
    if @supervisor.operators.present?
      @supervisor = Supervisor.find(params[:id])
      @supervisor.operators.delete_all
    end

    params[:supervisor][:operators2].each do |operator|
      if operator.present?
        nuevo = OperatorSupervisor.new
        nuevo[:operator_id] = operator
        nuevo[:supervisor_id] = @supervisor.id
        nuevo.save
      end
    end
    respond_to do |format|
      if @supervisor.update(supervisor_params)
        format.html { redirect_to admin_supervisors_path, notice: 'Supervisor editado satisfactoriamente' }
      else
        render :edit , alert: 'Operador no editado satisfactoriamente' 
      end
    end
  end

#  def activate
#    @supervisor = Supervisor.find(params[:id])
#  end

#  def enable
#    @supervisor = Supervisor.find(params[:id])
#    @supervisor[:state] = "Activo"
#    if @supervisor.update(supervisor_params)
#      redirect_to admin_supervisors_path, notice: 'Estado habilitado satisfactoriamente'
#    else
#      render :activate , alert: 'Estado no habilitado satisfactoriamente' 
#    end
#  end

  def retire
    @record = Record.new
  end

  def retired
    log(params)
    @supervisor = Supervisor.find(params[:id])
    @supervisor[:state] = "Retirado"

    if @supervisor.save

      nuevo = Record.new
      nuevo[:supervisor_id] = @supervisor.id
      nuevo[:state] = "Retirado"
      nuevo[:description] = params[:record][:description]
      nuevo[:retirementdate] = params[:record][:retirementdate]
      nuevo.save

      redirect_to admin_supervisors_path, notice: 'Estado inhabilitado satisfactoriamente'
    else
      render :retire , alert: 'Estado no inhabilitado satisfactoriamente' 
    end
  end


  def reinstate
    @record = Record.new
  end

  def reinstated
    @supervisor = Supervisor.find(params[:id])
    @supervisor[:state] = "Reintegrado"

    if @supervisor.save

      nuevo = Record.new
      nuevo[:supervisor_id] = @supervisor.id
      nuevo[:state] = "Reintegrado"
      nuevo[:description] = params[:record][:description]
      nuevo[:reinstatedate] = params[:record][:reinstatedate]
      nuevo.save
      
      redirect_to admin_supervisors_path, notice: 'Estado inhabilitado satisfactoriamente'
    else
      render :reinstate , alert: 'Estado no inhabilitado satisfactoriamente' 
    end
  end

  def destroy
    @supervisor.destroy
    respond_to do |format|
      format.html { redirect_to admin_supervisors_path, notice: 'Supervisor was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supervisor
      @supervisor = Supervisor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supervisor_params
      params.require(:supervisor).permit(:user_id, :name, :lastname, :cc, :state, :job_id, :dateadmission, :retirementdate, :description, :gender)
    end
end
