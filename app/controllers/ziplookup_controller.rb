class ZiplookupController < ApplicationController
	include Geokit::Geocoders
	def show
		client = GeonamesGeocoder.geocode(params[:id])
		home = GeonamesGeocoder.geocode('94115')
		@result = client.distance_from(home).round(2)
  end

  def showCoverage
    client = GeonamesGeocoder.geocode(params[:zip])

  end
end
