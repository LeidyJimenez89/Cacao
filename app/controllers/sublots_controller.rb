class SublotsController < ApplicationController
  before_action :set_sublot, only: [:show, :edit, :update, :destroy]

  # GET /sublots
  # GET /sublots.json
  def index
    @sublots = Sublot.all
  end

  # GET /sublots/1
  # GET /sublots/1.json
  def show
  end

  # GET /sublots/new
  def new
    @sublot = Sublot.new
  end

  # GET /sublots/1/edit
  def edit
  end

  # POST /sublots
  # POST /sublots.json
  def create
    @sublot = Sublot.new(sublot_params)

    respond_to do |format|
      if @sublot.save
        format.html { redirect_to @sublot, notice: 'Sublot was successfully created.' }
        format.json { render :show, status: :created, location: @sublot }
      else
        format.html { render :new }
        format.json { render json: @sublot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sublots/1
  # PATCH/PUT /sublots/1.json
  def update
    respond_to do |format|
      if @sublot.update(sublot_params)
        format.html { redirect_to @sublot, notice: 'Sublot was successfully updated.' }
        format.json { render :show, status: :ok, location: @sublot }
      else
        format.html { render :edit }
        format.json { render json: @sublot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sublots/1
  # DELETE /sublots/1.json
  def destroy
    @sublot.destroy
    respond_to do |format|
      format.html { redirect_to sublots_url, notice: 'Sublot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sublot
      @sublot = Sublot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sublot_params
      params.require(:sublot).permit(:code, :name, :user_id, :description)
    end
end
