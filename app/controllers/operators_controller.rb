class OperatorsController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]

  # GET /operators
  # GET /operators.json
  def index
    @operators = Operator.all
  end

  # GET /operators/1
  # GET /operators/1.json
  def show
  end

  # GET /operators/new
  def new
    @operator = Operator.new
  end

  # GET /operators/1/edit
  def edit
  end
  
  def enable
    @operator = Operator.find(params[:id])
    @operator[:state] = "Activo"
    if @operator.save
      redirect_to admin_operators_path, notice: 'Estado habilitado satisfactoriamente'
    else
      render :new , alert: 'Estado no habilitado satisfactoriamente' 
    end
  end

  def retired
    @operator = Operator.find(params[:id])
    @operator[:state] = "Retirado"
    if @operator.save
      redirect_to admin_operators_path, notice: 'Estado inhabilitado satisfactoriamente'
    else
      render :new , alert: 'Estado no inhabilitado satisfactoriamente' 
    end
  end

  def reinstated
    @operator = Operator.find(params[:id])
    @operator[:state] = "Reintegrado"
    if @operator.save
      redirect_to admin_operators_path, notice: 'Estado inhabilitado satisfactoriamente'
    else
      render :new , alert: 'Estado no inhabilitado satisfactoriamente' 
    end
  end

  def create
    @operator = Operator.new(operator_params)
      if @operator.save
        redirect_to operators_path, notice: 'Operador creado satisfactoriamente'
      else
        render :new , alert: 'Operador no creado satisfactoriamente' 
      end
  end

  def update
    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to operators_path, notice: 'Operator was successfully updated.' }
      else
        render :edit , alert: 'Operador no editado satisfactoriamente' 
      end
    end
  end

  def destroy
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to operators_path, notice: 'Operator was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator
      @operator = Operator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_params
      params.require(:operator).permit(:cc, :name, :position, :dateadmission, :state , :job_id, :lastname, :retirementdate, :description, :gender)
    end
end
