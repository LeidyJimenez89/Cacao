class Admin::ConfigsController < ApplicationController
  before_action :set_config, only: [:show, :edit, :update, :destroy]

  def index
    @configurations = Config.first
  end

  # GET /operators/new
  def new
    @configuration = Config.new
  end

  def create
    @configuration = Config.new(config_params)

    if @configuration.save
      redirect_to admin_configs_path, notice: 'Registro guardado'
    else
      render :new , alert: 'Registro no esta guardado' 
    end
  end

  def edit
    @configuration = Config.find(params[:id])
  end

  def update
    @configuration = Config.find(params[:id])

    if @configuration.update(config_params)
      redirect_to admin_configs_path, notice: 'Registro editado'
    else
      render :new , alert: 'Registro no esta editado' 
    end
  end

  def destroy
    @configuration = Config.find(params[:id])
    @configuration.destroy
 
    redirect_to admin_configs_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @configuration = Config.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def config_params
      params.require(:config).permit(:supervisor_id, :operator_id, :costc_id, :sublot_id, :labor_id, :wageamount, :laboramount)
    end
end
