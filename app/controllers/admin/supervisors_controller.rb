class Admin::SupervisorsController < ApplicationController
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


  def create
    @supervisor = Supervisor.new(supervisor_params)
    if @supervisor.save
      redirect_to admin_supervisors_path, notice: 'Supervisor creado satisfactoriamente'
    else
      render :new , alert: 'Operador no creado satisfactoriamente' 
    end
  end


  def update
    respond_to do |format|
      if @supervisor.update(supervisor_params)
        format.html { redirect_to admin_supervisors_path, notice: 'Supervisor editado satisfactoriamente' }
      else
        render :edit , alert: 'Operador no editado satisfactoriamente' 
      end
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
      params.require(:supervisor).permit(:user_id, :name, :lastname, :cc, :state, :position, :dateadmission)
    end
end
