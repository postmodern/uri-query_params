# frozen_string_literal: true

require_relative 'query_params'

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
      # Called when {Mixin} is included into a URI Class. Overrides the `query`
      # and `query=` methods to transparently update the {#query_params}.
      #
      def self.included(base)
        base.module_eval do
          alias raw_query query

          #
          # The raw query-string.
          #
          # @return [String, nil]
          #   The raw query-string.
          #
          # @see QueryParams.dump
          #
          # @since 0.5.2
          #
          def query
            if defined?(@query_params) && @query_params
              URI::QueryParams.dump(@query_params)
            else
              raw_query
            end
          end

          alias raw_query= query=

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
          # @see QueryParams.parse
          #
          def query=(new_query)
            new_query = (self.raw_query = new_query)

            parse_query_params! if defined?(@query_params) && @query_params
            return new_query
          end
        end
      end

      #
      # Deep-copies the {#query_params} from another URL.
      #
      # @param [Mixin] url
      #   The other URL to deep-copy the query_params from.
      #
      # @since 0.5.1
      #
      def initialize_copy(url)
        if (params = url.instance_variable_get('@query_params'))
          @query_params = params.dup
        end

        super(url)
      end

      #
      # The query params of the URI.
      #
      # @return [Hash{String => String}]
      #   The query params of the URI.
      #
      # @see QueryParams.parse
      #
      def query_params
        parse_query_params! unless @query_params
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

      private

      #
      # Parses the query parameters from the query data, populating
      # query_params with the parsed parameters.
      #
      # @see QueryParams.parse
      #
      # @since 0.5.2
      #
      def parse_query_params!
        @query_params = URI::QueryParams.parse(@query)
      end

    end
  end
end
