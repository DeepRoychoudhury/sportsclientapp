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
  	uri = URI.parse("https://sportsrest.azurewebsites.net/api/sports/add")
  	response = Net::HTTP.post_form(uri, {"country" => @parameters[:country],"sportsplayed" => @parameters[:sportsplayed]})
  	http = Net::HTTP.new(uri.host, uri.port)
  	http.use_ssl = true
  	request = Net::HTTP::Post.new(uri.request_uri)  	
  	request.set_form_data({"country" => @parameters[:country],"sportsplayed" => @parameters[:sportsplayed]})
  	request.set_content_type("application/json")
  	response = http.request(request)
  	puts response.code
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
