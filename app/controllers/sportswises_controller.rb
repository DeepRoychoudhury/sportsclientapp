class SportswisesController < ApplicationController
  before_action :set_sportswise, only: [:show, :edit, :update, :destroy]

  # GET /sportswises
  # GET /sportswises.json
  def index
    begin
    @sport = Sport.find(params[:sport_id])
    @sportskits = Sportskit.all.where(:sport_id => @sport.id)
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # GET /sportswises/1
  # GET /sportswises/1.json
  def show
  end

  # GET /sportswises/new
  def new
    begin
    @sportswise = Sportswise.new
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # GET /sportswises/1/edit
  def edit
  end

  # POST /sportswises
  # POST /sportswises.json
  def create
    begin
    @sportswise = Sportswise.new(sportswise_params)

    respond_to do |format|
      if @sportswise.save
        format.html { redirect_to @sportswise, notice: 'Sportswise was successfully created.' }
        format.json { render :show, status: :created, location: @sportswise }
      else
        format.html { render :new }
        format.json { render json: @sportswise.errors, status: :unprocessable_entity }
      end
    end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # PATCH/PUT /sportswises/1
  # PATCH/PUT /sportswises/1.json
  def update
    begin
    respond_to do |format|
      if @sportswise.update(sportswise_params)
        format.html { redirect_to @sportswise, notice: 'Sportswise was successfully updated.' }
        format.json { render :show, status: :ok, location: @sportswise }
      else
        format.html { render :edit }
        format.json { render json: @sportswise.errors, status: :unprocessable_entity }
      end
    end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # DELETE /sportswises/1
  # DELETE /sportswises/1.json
  def destroy
    begin
    @sportswise.destroy
    respond_to do |format|
      format.html { redirect_to sportswises_url, notice: 'Sportswise was successfully destroyed.' }
      format.json { head :no_content }
    end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sportswise
      @sportswise = Sportswise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sportswise_params
      params.require(:sportswise).permit(:sportskit, :sports_id)
    end
end
