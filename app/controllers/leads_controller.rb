class LeadsController < ApplicationController
  def new
    @token = "b7f41db790bb39eaf3cc9195c0a7866a"
    @url = "https://crm.zoho.com/crm/private/xml/Leads/insertRecords?"
    @xml = {token:@token, scope:"crmapi", xmlData:"<?xml version='1.0' encoding='UTF-8' ?>
<Leads>
<row no='1'>
<FL val='Lead Owner'>theo@refinedk9.com</FL>
<FL val='Lead Source'>Scheduler</FL>
<FL val='First Name'>#{params[:fname].capitalize}</FL>
<FL val='Last Name'>#{params[:lname].capitalize}</FL>
<FL val='Email'>#{params[:email]}</FL>
<FL val='Phone'>#{params[:phone]}</FL>
<FL val='City'>#{params[:city]}</FL>
<FL val='State'>#{params[:state]}</FL>
<FL val='LEADCF1'>#{params[:dogname]}</FL>
<FL val='LEADCF2'>#{params[:breed]}</FL>
<FL val='Description'>#{params[:comments]}</FL>
</row>
</Leads>"}
  end
end
