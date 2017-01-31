json.array! @geo_names do |geo_name|
  json.country_code   geo_name.country_code
  json.postal_code    geo_name.postal_code
  json.place_name     geo_name.place_name
  json.admin_name1    geo_name.admin_name1
  json.admin_code1    geo_name.admin_code1
  json.admin_name2    geo_name.admin_name2
  json.admin_code2    geo_name.admin_code2
  json.admin_name3    geo_name.admin_name3
  json.admin_code3    geo_name.admin_code3
  json.latitude       geo_name.latitude
  json.longitude      geo_name.longitude
  json.accuracy       geo_name.accuracy
  json.country_alpha3 geo_name.country_alpha3
  json.country_name   geo_name.country_name
end
