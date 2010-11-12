require 'uri'

module URI
  module QueryParams
    # RFC 3986 unsafe characters (including ' ')
    UNSAFE = [
      ' ', '!', '*', "'", '(', ')', ';', ':', '@', '&', '=', '+', '$', ',',
      '/', '?', '%', '#', '[', ']'
    ].join

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
          name, value = param.split('=',2)

          if value
            query_params[name] = URI.unescape(value)
          else
            query_params[name] = ''
          end
        end
      end

      return query_params
    end

    #
    # Dumps the URI query params.
    #
    # @param [Hash{String => String}] query_params
    #   The query params.
    #
    # @return [String]
    #   The dumped URI query string.
    #
    # @since 0.5.0
    #
    def QueryParams.dump(query_params)
      query = []

      query_params.each do |name,value|
        value = case value
                when Array
                  URI.escape(value.join(' '),UNSAFE)
                when true
                  'active'
                when false, nil
                  ''
                else
                  URI.escape(value.to_s,UNSAFE)
                end

        query << "#{name}=#{value}"
      end

      return query.join('&')
    end

  end
end
