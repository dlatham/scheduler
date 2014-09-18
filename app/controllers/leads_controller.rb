class LeadsController < ApplicationController
  require 'uri'
  require 'net/http'

  def new
    #@token = "0106c7baac3107727ae53c952dc5fbbe"
    #@url = "https://crm.zoho.com/crm/private/xml/Leads/insertRecords?"
    @xml = URI.encode("<?xml version='1.0' encoding='UTF-8' ?><Leads><row no='1'><FL val='Lead Owner'>theo@refinedk9.com</FL><FL val='Lead Source'>Scheduler</FL><FL val='First Name'>#{params[:fname].capitalize}</FL><FL val='Last Name'>#{params[:lname].capitalize}</FL><FL val='Email'>#{params[:email]}</FL><FL val='Phone'>#{params[:phone]}</FL><FL val='City'>#{params[:city]}</FL><FL val='State'>#{params[:state]}</FL><FL val='LEADCF1'>#{params[:dogname]}</FL><FL val='LEADCF2'>#{params[:breed]}</FL><FL val='Description'>#{params[:comments]}</FL></row></Leads>")
    #@xml = {authToken:@token, scope:"crmapi", xmlData:"<?xml version='1.0' encoding='UTF-8' ?><Leads><row no='1'><FL val='Lead Owner'>theo@refinedk9.com</FL><FL val='Lead Source'>Scheduler</FL><FL val='First Name'>#{params[:fname].capitalize}</FL><FL val='Last Name'>#{params[:lname].capitalize}</FL><FL val='Email'>#{params[:email]}</FL><FL val='Phone'>#{params[:phone]}</FL><FL val='City'>#{params[:city]}</FL><FL val='State'>#{params[:state]}</FL><FL val='LEADCF1'>#{params[:dogname]}</FL><FL val='LEADCF2'>#{params[:breed]}</FL><FL val='Description'>#{params[:comments]}</FL></row></Leads>"}.to_param

    uri = URI('https://crm.zoho.com/crm/private/xml/Leads/insertRecords')
    req = Net::HTTP::Post.new(uri)
    req.set_form_data('authToken' => '0106c7baac3107727ae53c952dc5fbbe', 'scope' => 'crmapi', 'xmlData' => @xml)

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(req)
    end

    case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        @response = res.value
      else
        @response = res.value
    end



  end
end
