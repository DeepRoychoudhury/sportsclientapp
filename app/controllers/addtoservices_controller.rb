require 'rest-client'
require 'json'
class AddtoservicesController < ApplicationController
  def index
  end

  def new
  	@addtoservice = Addtoservice.new
  end

  def create
  	@parameters = addtoservice_params
    unless current_user && current_user.admin?
      
    else
    json_obj = JSON.generate({:country => @parameters[:country], :sportsplayed => @parameters[:sportsplayed]})
    binding.pry
  	data = RestClient.post("https://sportsrest.azurewebsites.net/api/sports/add",json_obj, :content_type => "text/plain")
  	end
    redirect_to new_addtoservice_path

  end

  def edit
  end

  private

    # Only allow a list of trusted parameters through.
    def addtoservice_params
      params.require(:addtoservice).permit(:country, :sportsplayed)
    end
end
