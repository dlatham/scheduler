An automated scheduler for Refined K9

SETUP

* Rails 4.1.5
* ruby 2.0.0



GEOKIT FIX
/Library/Ruby/Gems/2.0.0/gems/geokit-1.8.5/lib/geokit/geocoders/geonames.rb

Update if else with correct geonames URLs:
       if key
          "http://api.geonames.org#{params}&country=US&username=#{key}"
        else
          "http://ws.geonames.org#{params}&country=US"
        end



GEONAMES

Create account and enter your key in /config/initializers/geokit_config.rb