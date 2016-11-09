class Admin::TranscriptionsController < ApplicationController
  before_action :set_transcription, only: [:show, :edit, :update, :destroy]

  def index
    @transcriptions = Transcription.all
  end

  # GET /operators/new
  def new
    @transcription = Transcription.new
  end

  def create
    @transcription = Transcription.new(transcription_params)

    if @transcription.labor.paymentunit == "Jornal"
      @transcription[:subtotal]= params[:transcription][:wageamount].to_f * @transcription.labor.rate.to_f
    else
      @transcription[:subtotal]= params[:transcription][:laboramount].to_f * @transcription.labor.rate.to_f
    end

    if @transcription.save
      redirect_to admin_transcriptions_path, notice: 'Registro guardado'
    else
      render :new , alert: 'Registro no esta guardado' 
    end
  end

  def get_jobs
    op = Operator.where(id: params[:operatorId]).first
    jobs = Array.new

    if op.present?
      jobs = op.jobs.map { |e| { value: e.id, text: e.name } }
    end

    respond_to do |format|
      format.html { render :json => "Hola mundo" }
      format.json { render :json => jobs }
    end

  end

  def edit
    @transcription = Transcription.find(params[:id])
  end

  def update
    @transcription = Transcription.find(params[:id])

    if @transcription.labor.paymentunit == "Jornal"
      @transcription[:subtotal]= params[:transcription][:wageamount].to_f * @transcription.labor.rate.to_f
    else
      @transcription[:subtotal]= params[:transcription][:laboramount].to_f * @transcription.labor.rate.to_f
    end

    if @transcription.update(transcription_params)
      redirect_to admin_transcriptions_path, notice: 'Registro editado'
    else
      render :new , alert: 'Registro no esta editado' 
    end
  end

  def destroy
    @transcription = Transcription.find(params[:id])
    @transcription.destroy
 
    redirect_to admin_transcriptions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcription
      @transcription = Transcription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transcription_params
      params.require(:transcription).permit(:supervisor_id, :operator_id, :costc_id, :sublot_id, :labor_id, :wageamount, :laboramount)
    end
end
