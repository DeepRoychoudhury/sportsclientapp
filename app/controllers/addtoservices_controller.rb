require 'net/http'
require 'uri'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
class AddtoservicesController < ApplicationController
  def index
  end

  def new
  	@addtoservice = Addtoservice.new
  end

  def create
  	@parameters = addtoservice_params
  	http = Net::HTTP.new("sportsrest.azurewebsites.net")
  	http.use_ssl = true
  	http.ssl_version = "SSLv3"
  	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  	request = Net::HTTP::Post.new("/api/sports/add")
  	request.set_form_data({"country" => @parameters[:country],"sportsplayed" => @parameters[:sportsplayed]})
  	response = http.request(request)

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
