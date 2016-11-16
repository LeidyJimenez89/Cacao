class Admin::RegistersController < ApplicationController

  def index
    @registrations = Register.all
  end

  def new
    @registration = Register.new
    @operators = Operator.all
    @supervisors = Supervisor.all
  end

  def create
    @registration = Register.first

    if @registration.update(register_params)
      redirect_to admin_index_register_path, notice: 'Registro editado'
    else
      render :new , alert: 'Registro no esta editado' 
    end
  end

  def edit
    @registration = Register.first
  end

  def update
    @registration = Register.first

    if @registration.update(register_params)
      redirect_to admin_index_register_path, notice: 'Registro editado'
    else
      render :new , alert: 'Registro no esta editado' 
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:vehicleAllowance, :housingAllowance)
    end
end
