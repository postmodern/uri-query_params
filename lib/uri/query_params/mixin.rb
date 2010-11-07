require 'uri/query_params/query_params'

require 'cgi'

module URI
  module QueryParams
    #
    # Adds the ability to parse individual parameters from a the query field
    # of a URI.
    #
    module Mixin
      # Allows setting the query_params.
      attr_writer :query_params

      #
      # Sets the query string and updates query_params.
      #
      # @param [String] query_str
      #   The new URI query string to use.
      #
      # @return [String]
      #   The new URI query string.
      #
      # @example
      #   url.query = 'a=1&b=2'
      #   # => "a=1&b=2"
      #
      def query=(query_str)
        new_query = super(query_str)
        parse_query_params
        return new_query
      end

      #
      # The query params of the URI.
      #
      # @return [Hash{String => String}]
      #   The query params of the URI.
      #
      def query_params
        parse_query_params unless @query_params
        return @query_params
      end

      #
      # Iterates over every query parameter.
      #
      # @yield [name, value]
      #   The block to pass each query parameter to.
      #
      # @yieldparam [String] name
      #   The name of the query parameter.
      #
      # @yieldparam [String] value
      #   The value of the query parameter.
      #
      # @example
      #   url.each_query_param do |name,value|
      #     puts "#{name} = #{value}"
      #   end
      #
      def each_query_param(&block)
        query_params.each(&block)
      end

      protected

      #
      # Parses the query parameters from the query data, populating
      # query_params with the parsed parameters.
      #
      def parse_query_params
        @query_params = QueryParams.parse(@query)
      end

      private

      def path_query
        unless (@query_params.nil? || @query_params.empty?)
          str = @path

          unless @query_params.empty?
            str += '?' + QueryParams.dump(@query_params)
          end

          str
        else
          # do not rebuild the path-query, if the query_params have not
          # been parsed yet
          super
        end
      end
    end
  end
end
