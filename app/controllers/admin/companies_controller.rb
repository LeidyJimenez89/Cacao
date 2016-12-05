class Admin::CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)

    if @company.save(company_params)
      redirect_to admin_companies_path, notice: 'Empresa presatdora de servicio creada satisfactoriamente'
    else
      render :new , alert: 'Empresa presatdora de servicio no creada satisfactoriamente' 
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to admin_companies_path, notice: 'Empresa presatdora de servicio editada satisfactoriamente'
    else
      render :new , alert: 'Empresa presatdora de servicio no editada satisfactoriamente' 
    end
  end

  def destroy
    @company = Company.find(params[:id])

    @company.destroy
    redirect_to admin_companies_path, notice: 'Empresa presatdora de servicio eliminada satisfactoriamente'

  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:nit, :name, :phone, :address, :description)
    end
end
