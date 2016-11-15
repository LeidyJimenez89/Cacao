class Admin::ConfigsController < ApplicationController

  def index
    @configurations = Config.first
  end

  def edit
    @config = Config.first
  end

  def update
    @configuration = Config.first

    if @configuration.update(config_params)
      redirect_to admin_index_config_path, notice: 'Registro editado'
    else
      render :new , alert: 'Registro no esta editado' 
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def config_params
      params.require(:config).permit(:basepay)
    end
end
