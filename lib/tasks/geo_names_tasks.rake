namespace :geo_name_postal do
  namespace :seed do

    desc "Import all postal codes from CSV_PATH"
    task :load_postal_codes, [:csv_path] => [:environment] do
      require 'csv'
      require 'activerecord-import'
      require 'countries/global'

      HEADER = %i[
        country_code
        postal_code
        place_name
        admin_name1 admin_code1
        admin_name2 admin_code2
        admin_name3 admin_code3
        latitude
        longitude
        accuracy
        country_alpha3
        country_name
      ]

      csv_path ||= ENV['CSV_PATH'] || abort("Please, provide the csv path")

      import      = []
      errors      = Hash.new { |h, k| h[k] = [] }
      csv_options = {headers: HEADER, col_sep: "\t", converters: :all, quote_char: "\x00"}
      imported    = 0
      batch_size  = ENV['BATCH_SIZE'] || 1_000

      File.open(csv_path, "r").each_slice(batch_size) do |lines|
        import = lines.map.with_index do |line, line_number|
          begin
            line    = CSV.parse_line(line, csv_options)
            country = Country[line[:country_code]]
            import  = []

            GeoNamePostals::GeoNamePostal.new(
              country_code: line[:country_code],
              postal_code: line[:postal_code],
              place_name: line[:place_name],
              admin_name1: line[:admin_name1],
              admin_code1: line[:admin_code1],
              admin_name2: line[:admin_name2],
              admin_code2: line[:admin_code2],
              admin_name3: line[:admin_name3],
              admin_code3: line[:admin_code3],
              latitude: line[:latitude],
              longitude: line[:longitude],
              accuracy:  line[:accuracy],
              country_alpha3: country&.alpha3,
              country_name: country&.name
            )

          rescue CSV::MalformedCSVError => e
            errors[imported + line_number] = {error: e.message, line: line}
            nil
          end
        end

        import.compact!

        GeoNamePostals::GeoNamePostal.import(import, on_duplicate_key_ignore: true)
        imported += batch_size
        import = []

        print "imported: #{imported}\t\t\terrors: #{errors.size}\r"
      end

      p errors
    end
  end
end

