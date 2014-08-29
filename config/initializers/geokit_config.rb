# These defaults are used in Geokit::Mappable.distance_to and in acts_as_mappable
    Geokit::default_units = :miles # others :kms, :nms, :meters
    Geokit::default_formula = :sphere
    Geokit::Geocoders::request_timeout = 3
    Geokit::Geocoders::GoogleGeocoder.api_key = 'AIzaSyCbr5LgDqnqEB_5lQS4z_bpSLgxOdJqOII'
    Geokit::Geocoders::GeonamesGeocoder.key = 'refinedk9'