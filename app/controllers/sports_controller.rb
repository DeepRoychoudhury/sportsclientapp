require 'net/http'
require 'json'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
class SportsController < ApplicationController
  before_action :set_sport, only: [:show, :edit, :update, :destroy]

  # GET /sports
  # GET /sports.json
  def index
    begin
    @country=""
    @sportsplayed=""
    @countrywisesports=""
    @sortedsports
    url = 'https://sportsrest.azurewebsites.net/api/sports/listall'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    result.each do |res|
      @country = res["country"]
      @sportsplayed = res["sportsplayed"]
      @countrywisesports = @countrywisesports + @country.to_s + "-" + @sportsplayed.to_s + ";"
    end
    @sportsadded = Sport.all
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # GET /sports/1
  # GET /sports/1.json
  def show
  end

  # GET /sports/new
  def new
    begin
    @sport = Sport.new
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # GET /sports/1/edit
  def edit
  end

  # POST /sports
  # POST /sports.json
  def create    
    begin 
    @sport = Sport.new(sport_params)

    respond_to do |format|
      if @sport.save
        format.html { redirect_to @sport, notice: 'Sport was successfully created.' }
        format.json { render :show, status: :created, location: @sport }
      else
        format.html { render :new }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # PATCH/PUT /sports/1
  # PATCH/PUT /sports/1.json
  def update
    begin
    respond_to do |format|
      if @sport.update(sport_params)
        format.html { redirect_to @sport, notice: 'Sport was successfully updated.' }
        format.json { render :show, status: :ok, location: @sport }
      else
        format.html { render :edit }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  # DELETE /sports/1
  # DELETE /sports/1.json
  def destroy
    begin
    @sport.destroy
    respond_to do |format|
      format.html { redirect_to sports_url, notice: 'Sport was successfully destroyed.' }
      format.json { head :no_content }
    end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sport
      @sport = Sport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sport_params
      params.require(:sport).permit(:sport)
    end
end
