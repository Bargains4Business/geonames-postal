FactoryGirl.define do
  factory :code, class: 'GeoNamePostals::Code' do
    country_code "DZ"
    postal_code '13004'
    place_name 'Ramla "Ouled El Ghellis"'
    admin_name1 'Tlemcen'
    admin_code1 nil
    admin_name2 nil
    admin_code2 nil
    admin_name3 nil
    admin_code3 nil
    latitude "35.0136"
    longitude "-1.748"
    accuracy 3
    country_alpha3 "DZA"
    country_name "Algeria"

    factory :au_postal_code do
      country_code "AU"
      postal_code '4207'
      place_name 'Yatala DC'
      admin_name1 'Queensland'
      admin_code1 'QLD'
      latitude "-27.7079"
      longitude "153.1842"
      country_alpha3 "AUS"
      country_name "Australia"
    end

    factory :ca_postal_code do
      country_code "CA"
      postal_code 'T0A'
      place_name 'Eastern Alberta (St. Paul)'
      admin_name1 'Alberta'
      admin_code1 'AB'
      latitude "54.766"
      longitude "-111.7174"
      country_alpha3 "CAN"
      country_name "Canada"
    end

    factory :ar_postal_code do
      country_code "AR"
      postal_code '1612'
      place_name 'ADOLFO SOURDEAUX'
      admin_name1 'BUENOS AIRES'
      admin_code1 'B'
      latitude "-34.4696"
      longitude "-58.6713"
      country_alpha3 "ARG"
      country_name "Argentina"
    end

    factory :us_postal_code do
      country_code "US"
      postal_code '70394'
      place_name 'Raceland'
      admin_name1 'Louisiana LA'
      admin_code1 'LA'
      admin_name2 'Lafourche'
      admin_code2 '057'
      latitude "29.7178"
      longitude "-90.5999"
      accuracy 4
      country_alpha3 "USA"
      country_name "United States of America"
    end

    factory :br_postal_code do
      country_code "BR"
      postal_code '01000-000'
      place_name 'São Paulo'
      admin_name1 'Sao Paulo'
      admin_code1 '27'
      admin_code2 '3550308'
      latitude "-23.627"
      longitude "-46.635"
      country_alpha3 "BRL"
      country_name "Brazil"
    end
  end
end
