class Admin::BillingcsController < ApplicationController

  def index
    @billingcs = Billingc.all
  end

  # GET /operators/new
  def new
    @billingc = Billingc.new
  end

  def create
    @billingc = Billingc.new

    if @billingc.save
      redirect_to admin_billingcs_path, notice: 'Centro de facturación creado satisfactoriamente'
    else
      render :new , alert: 'Centro de facturación no creado satisfactoriamente' 
    end
  end

  def edit
    @billingc = Billingc.find(params[:id])
  end

  def update
    @billingc = Billingc.find(params[:id])

    if @billingc.update
      redirect_to admin_billingcs_path, notice: 'Centro de facturación editado satisfactoriamente'
    else
      render :new , alert: 'Centro de facturación no editado satisfactoriamente' 
    end
  end

  def destroy
    @billingc = Billingc.find(params[:id])
    @billingc.destroy
 
    redirect_to admin_billingcs_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def config_params
      params.require(:config).permit(:name, :description)
    end
end
