module GeoNames
  class GeoNameQuery

    ARGENTINA = %w[argentina ar arg].freeze
    BRAZIL    = %w[brazil br bra].freeze

    def initialize(postal_code, country)
      @postal_code, @country = postal_code, country
    end

    def perform_default_query
      GeoName.by_postal_code(@postal_code).by_country(@country)
    end

    def perform
      handle_special_countries
    end

    def handle_special_countries
      case @country.downcase
      when *ARGENTINA then query_postal_code_for_argentina
      when *BRAZIL then query_postal_code_for_brazil
      else
        perform_default_query
      end
    end

    # The Argentina data file contains 4-digit postal codes which were replaced with a new system in 1999.
    # New system adds a leading digit to form 5 digits, e.g. YXXXX
    def query_postal_code_for_argentina
      postal_code = if @postal_code.size == 5
            @postal_code
          elsif @postal_code.size == 4
            "%#{@postal_code}"
          else
            "%#{@postal_code}%"
          end

      GeoName.by_country(@country).where("postal_code like ?", postal_code).ordered
    end

    def query_postal_code_for_brazil
      # handle Brazil with brazilian-rails gem
      perform_default_query
    end

  end
end
