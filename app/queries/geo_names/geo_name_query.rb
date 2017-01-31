module GeoNames
  class GeoNameQuery

    ARGENTINA = %w[argentina ar arg].freeze
    BRAZIL    = %w[brazil br bra].freeze
    CANADA    = %w[canada ca can].freeze
    IRELAND   = %w[ireland ie irl].freeze
    MALTA     = %w[malta mt mlt].freeze

    def initialize(postal_code, country)
      @postal_code, @country = postal_code, country
    end

    def default_query_base
      GeoName.
        by_country(@country).
        ordered
    end

    def perform_default_query
      default_query_base.by_postal_code(@postal_code)
    end

    def perform
      handle_special_countries
    end

    def handle_special_countries
      case @country.downcase
      when *ARGENTINA then query_postal_code_for_argentina
      when *BRAZIL then query_postal_code_for_brazil
      when *CANADA, *IRELAND, *MALTA
        query_postal_code_for_copyrighted_countries
      else
        perform_default_query
      end
    end

    # The Argentina data file contains 4-digit postal codes which were replaced with a new system in 1999.
    # New system adds a leading digit to form 5 digits, e.g. YXXXX
    def query_postal_code_for_argentina
      postal_code = if @postal_code.size > 4
                      @postal_code[1..4]
                    elsif @postal_code.size == 4
                      @postal_code
                    else
                      "%#{@postal_code}%"
                    end

      default_query_base.where("postal_code like ?", postal_code)
    end

    # For Canada (CA) we have only the first 3 letters of the full postal codes (for copyright reasons)
    # For Ireland (IE) we have only the first 3 letters of the full postal codes (for copyright reasons)
    # For Malta (MT) we have only the first 3 letters of the full postal codes (for copyright reasons)
    def query_postal_code_for_copyrighted_countries
      postal_code = if @postal_code.size > 3
                      @postal_code[0..2]
                    elsif @postal_code.size == 3
                      @postal_code
                    else
                      "#{@postal_code}%"
                    end

      default_query_base.where("postal_code like ?", postal_code)
    end

    def query_postal_code_for_brazil
      # handle Brazil with brazilian-rails gem
      perform_default_query
    end

  end
end
