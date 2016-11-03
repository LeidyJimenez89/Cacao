class Admin::TranscriptionsController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]


  # GET /operators/new
  def new
    @transcription = Transcription.new
  end

  def create
    if @transcription.save
      redirect_to admin_transcriptions_path, notice: 'Registro guardado'
    else
      render :new , alert: 'Registro no esta guardado' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcription
      @transcription = Transcription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transcription_params
      params.require(:transcription).permit(:cc)
    end
end
