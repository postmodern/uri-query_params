require 'uri'

module URI
  module QueryParams
    #
    # Parses a URI query string.
    #
    # @param [String] query_string
    #   The URI query string.
    #
    # @return [Hash{String => String}]
    #   The parsed query parameters.
    #
    def QueryParams.parse(query_string)
      query_params = {}

      if query_string
        query_string.split('&').each do |param|
          name, value = param.split('=')

          if value
            query_params[name] = URI.decode(value)
          else
            query_params[name] = ''
          end
        end
      end

      return query_params
    end

  end
end
