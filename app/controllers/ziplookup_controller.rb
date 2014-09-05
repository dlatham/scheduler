class ZiplookupController < ApplicationController
	include Geokit::Geocoders
	def show
		@client = GeonamesGeocoder.geocode(params[:id])
		@distance = @client.distance_from([37.777,-122.445]).round(2) #home latitude and longitude
    if @distance < 15 then
      @result = {"service" => "full", "city" => @client.city, "state" => @client.state, "distance" => @distance}
    elsif @distance < 30 then
      @result = @result = {"service" => "limited", "city" => @client.city, "state" => @client.state, "distance" => @distance}
    else
      @result = @result = {"service" => "none", "city" => @client.city, "state" => @client.state, "distance" => @distance}
    end
    render json: @result
  end
end
