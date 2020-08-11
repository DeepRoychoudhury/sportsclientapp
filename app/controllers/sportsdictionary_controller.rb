require 'net/http'
require 'json'
require 'openssl'

class SportsdictionaryController < ApplicationController
  def index
  	@sportsdictionary=""
  	url = 'https://thesportsdb.com/api/v1/json/1/all_sports.php'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)
    result.each do |res|
    	res[1].each do |r|
      @sportsitem = r["strSport"]
      @sportsdescription = r["strSportDescription"]
      @sportsdictionary = @sportsdictionary + @sportsitem.to_s + "--" + @sportsdescription.to_s + ";;"

    end
    end
  end
end
