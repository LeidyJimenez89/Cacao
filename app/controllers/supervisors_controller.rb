class SupervisorsController < ApplicationController
  before_action :set_supervisor, only: [:show, :edit, :update, :destroy]

  # GET /supervisors
  # GET /supervisors.json
  def index
    @supervisors = Supervisor.all
  end

  # GET /supervisors/1
  # GET /supervisors/1.json
  def show
  end

  # GET /supervisors/new
  def new
    @supervisor = Supervisor.new
  end

  # GET /supervisors/1/edit
  def edit
  end

  # POST /supervisors
  # POST /supervisors.json
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

      redirect_to supervisors_path, notice: 'Supervisor creado satisfactoriamente'
    else
      render :new , alert: 'Supervisor no creado satisfactoriamente'
    end
  end

  # PATCH/PUT /supervisors/1
  # PATCH/PUT /supervisors/1.json
  def update
    respond_to do |format|
      if @supervisor.update(supervisor_params)
        format.html { redirect_to supervisors_path, notice: 'Supervisor editado satisfactoriamente' }
      else
        render :edit , alert: 'Supervisor no editado satisfactoriamente'
      end
    end
  end

  # DELETE /supervisors/1
  # DELETE /supervisors/1.json
  def destroy
    @supervisor.destroy
    respond_to do |format|
      format.html { redirect_to supervisors_path, notice: 'Supervisor was successfully destroyed.' }
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
