class SpookersController < ApplicationController
  before_action :set_spooker, only: [:show, :edit, :update, :destroy]

  # GET /spookers
  # GET /spookers.json
  def index
    @spookers = Spooker.all
  end

  # GET /spookers/1
  # GET /spookers/1.json
  def show
  end

  # GET /spookers/new
  def new
    @spooker = Spooker.new
  end

  # GET /spookers/1/edit
  def edit
  end


  def spooky_hash spooker_params
    h = 0;
    h += spooker_params[:name].length
    if spooker_params[:darkness] == true
      h = -h
    end
    h *= spooker_params[:story].length
    h *= spooker_params[:month].length
    h = h%10
  end

  # POST /spookers
  # POST /spookers.json
  def create
    @spooker = Spooker.new(spooker_params)
    @spooker.picture = spooky_hash spooker_params
    respond_to do |format|
      if @spooker.save
        format.html { redirect_to @spooker }
        format.json { render :show, status: :created, location: @spooker }
      else
        format.html { render :new }
        format.json { render json: @spooker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spookers/1
  # PATCH/PUT /spookers/1.json
  def update
    respond_to do |format|
      if @spooker.update(spooker_params)
        format.html { redirect_to @spooker, notice: 'Spooker was successfully updated.' }
        format.json { render :show, status: :ok, location: @spooker }
      else
        format.html { render :edit }
        format.json { render json: @spooker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spookers/1
  # DELETE /spookers/1.json
  def destroy
    @spooker.destroy
    respond_to do |format|
      format.html { redirect_to spookers_url, notice: 'Spooker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spooker
      @spooker = Spooker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spooker_params
      params.require(:spooker).permit(:name, :picture, :darkness, :story, :month, :movie)
    end
end
