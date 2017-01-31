module GeoNames
  class GeoNameQuery

    ARGENTINA = %w[argentina ar arg].freeze
    BRAZIL    = %w[brazil br bra].freeze

    def initialize(q, country = nil)
      @q, @country = q, country
    end

    def perform_default_query
      GeoName.get_by_postal_code(@q)
    end

    def perform
      return handle_special_countries if @country
      perform_default_query
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
      q = if @q.size == 5
            @q
          elsif @q.size == 4
            "%#{@q}"
          else
            "%#{@q}%"
          end

      GeoName.where("postal_code like ?", q).ordered
    end

    def query_postal_code_for_brazil
      # handle Brazil with brazilian-rails gem
      perform_default_query
    end

  end
end
