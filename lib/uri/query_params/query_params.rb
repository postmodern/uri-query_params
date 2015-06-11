require 'uri/common'

module URI
  module QueryParams
    # RFC 3986 unsafe characters (including ' ')
    UNSAFE = [
      '!', '*', "'", '(', ')', ';', ':', '@', '&', '=', '+', '$', ',',
      '/', '?', '%', '#', '[', ']', ' ', "\f", "\n", "\r", "\t", "\v",
      "\x7f", *("\x00".."\x1f")
    ].join

    #
    # Parses a URI query string.
    #
    # @param [String] query_string
    #   The URI query string.
    #
    # @yield [name,value]
    #   The given block will be passed each parsed query param.
    #
    # @yieldparam [String] name
    #   The name of the query param.
    #
    # @yieldparam [String] value
    #   The value of the query param.
    #
    # @return [Hash{String => String}]
    #   The parsed query parameters.
    #
    # @example
    #   QueryParams.parse("x=1&y=2")
    #   # => {"x"=>"1", "y"=>"2"}
    #
    # @example
    #   QueryParams.parse("x=a%20b%20c&y")
    #   # => {"x"=>"a b c", "y"=>""}
    #
    # @note
    #   Version 0.6.0 allows {parse} to yield the query params, in the order
    #   they are parsed.
    #
    def self.parse(query_string)
      query_params = {}

      if query_string
        query_string.split('&').each do |param|
          # skip empty params
          next if param.empty?

          name, value = param.split('=',2)
          value = if value
                    URI.unescape(value)
                  else
                    ''
                  end

          yield(name,value) if block_given?
          query_params[name] = value
        end
      end

      return query_params
    end

    #
    # Escapes a URI query param value.
    #
    # @param [Array, true, false, nil, #to_s] value
    #   The query param value to escape.
    #
    # @return [String]
    #   The raw escaped query param value.
    #
    # @since 0.7.1
    #
    def self.escape(value)
      case value
      when Array
        URI.escape(value.join(' '),UNSAFE)
      when true
        'active'
      when false, nil
        ''
      else
        URI.escape(value.to_s,UNSAFE)
      end
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
    # @example Dumping Strings
    #   QueryParams.dump('x' => '1', 'y' => '2')
    #   # => "x=1&x=2"
    #
    # @example Dumping non-Strings
    #   QueryParams.dump(:x => 1, :y => true, :z => false)
    #   # => "x=1&x=active&z="
    #
    # @example Dumping Arrays
    #   QueryParams.dump(:x => ['a','b','c'])
    #   # => "x=a%20b%20c"
    #
    # @since 0.5.0
    #
    def self.dump(query_params)
      query = []

      # explicitly re-order the Hash on Ruby 1.8.x
      query_params.rehash if RUBY_VERSION < '1.9'

      query_params.each do |name,value|
        value = escape(value)

        query << "#{name}=#{value}"
      end

      return query.join('&')
    end

  end
end
