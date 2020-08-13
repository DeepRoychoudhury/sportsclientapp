require 'rest-client'
require 'json'
require 'base64'
class AddtoservicesController < ApplicationController
  def index
  end

  def new
    begin 
  	@addtoservice = Addtoservice.new
  rescue Exception => e
    puts ("Found Exception : "+e.to_s)
  end
  end

  def create
    begin
  	@parameters = addtoservice_params
    unless current_user && current_user.admin?
      
    else
      auth = Base64.encode64("admin:secret")
      basic_auth = "Basic "+auth
    json_obj = JSON.generate({:country => @parameters[:country], :sportsplayed => @parameters[:sportsplayed]})
  	data = RestClient.post("https://sportsrest.azurewebsites.net/api/sports/add",json_obj, :content_type => "text/plain", :Authorization => basic_auth)
    binding.pry
  	end
    rescue Exception => e
    puts ("Found Exception : "+e.to_s)
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
