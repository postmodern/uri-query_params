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
          name, value = param.split('=',2)

          if value
            query_params[name] = URI.decode(value)
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
        param = case value
                when Array
                  "#{name}=#{CGI.escape(value.join(' '))}"
                when true
                  "#{name}=active"
                when false, nil
                  "#{name}="
                else
                  "#{name}=#{CGI.escape(value.to_s)}"
                end

        query << param
      end

      return query.join('&')
    end

  end
end
