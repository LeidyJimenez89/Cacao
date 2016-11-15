class Admin::ConfigurationsController < ApplicationController
  before_action :set_configuration, only: [:show, :edit, :update, :destroy]

  def index
    @configuration = Configuration.all
  end

  # GET /operators/new
  def new
    @configuration = Configuration.new
  end

  def create
    @configuration = Configuration.new(configuration_params)

    if @configuration.save
      redirect_to admin_configurations_path, notice: 'Registro guardado'
    else
      render :new , alert: 'Registro no esta guardado' 
    end
  end

  def edit
    @configuration = Configuration.find(params[:id])
  end

  def update
    @configuration = Configuration.find(params[:id])

    if @configuration.update(configuration_params)
      redirect_to admin_configurations_path, notice: 'Registro editado'
    else
      render :new , alert: 'Registro no esta editado' 
    end
  end

  def destroy
    @configuration = Configuration.find(params[:id])
    @configuration.destroy
 
    redirect_to admin_configurations_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration
      @configuration = Configuration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuration_params
      params.require(:configuration).permit(:supervisor_id, :operator_id, :costc_id, :sublot_id, :labor_id, :wageamount, :laboramount)
    end
end
