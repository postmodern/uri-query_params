require 'uri/query_params/mixin'

require 'uri/generic'

module URI
  class Generic

    include URI::QueryParams::Mixin

    private

    #
    # Parses the query parameters from the query data, populating
    # query_params with the parsed parameters.
    #
    # @see QueryParams.parse
    #
    # @since 0.5.2
    #
    def path_query
      if @query_params
        str = @path

        unless @query_params.empty?
          str += '?' + URI::QueryParams.dump(@query_params)
        end

        str
      else
        # do not rebuild the path-query, if the query_params have not
        # been parsed yet
        raw_path_query
      end
    end

    alias raw_path_query path_query

  end
end
