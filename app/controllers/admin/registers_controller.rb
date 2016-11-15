class Admin::ConfigsController < ApplicationController

  def index
    @registrations = Register.first
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
      params.require(:register).permit(:basepay)
    end
end
