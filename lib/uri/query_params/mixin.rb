require 'uri/query_params/query_params'

require 'cgi'

module URI
  module QueryParams
    #
    # Adds the ability to parse individual parameters from a the query field
    # of a URI.
    #
    module Mixin
      # Query parameters
      attr_accessor :query_params

      #
      # Creates a new URI::HTTP object and initializes query_params as a
      # new Hash.
      #
      def initialize(*args)
        super(*args)

        parse_query_params
      end

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
        @query_params.each(&block)
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
        str = @path

        unless @query_params.empty?
          str += '?' + @query_params.to_a.map { |name,value|
            if value==true
              "#{name}=active"
            elsif value
              if value.kind_of?(Array)
                "#{name}=#{CGI.escape(value.join(' '))}"
              else
                "#{name}=#{CGI.escape(value.to_s)}"
              end
            else
              "#{name}="
            end
          }.join('&')
        end

        return str
      end
    end
  end
end
