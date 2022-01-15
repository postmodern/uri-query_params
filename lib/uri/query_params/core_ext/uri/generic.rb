require 'uri/query_params/mixin'

require 'uri/generic'

module URI
  class Generic

    include URI::QueryParams::Mixin

    #
    # Constructs String from URI
    #
    # @note
    #   This is the `URI::Generic#to_s` method from Ruby 2.2.0, with the minor
    #   modification of calling the `query` method overrode by
    #   {URI::QueryParams::Mixin}, instead of `@query`.
    #
    # @see https://github.com/ruby/ruby/blob/v2_2_0/lib/uri/generic.rb#L1338-L1376
    #
    def to_s
      str = ''
      if @scheme
        str << @scheme
        str << ':'.freeze
      end

      if @opaque
        str << @opaque
      else
        if @host
          str << '//'.freeze
        end
        if self.userinfo
          str << self.userinfo
          str << '@'.freeze
        end
        if @host
          str << @host
        end
        if @port && @port != self.default_port
          str << ':'.freeze
          str << @port.to_s
        end
        str << @path
        if query
          str << '?'.freeze
          str << query
        end
      end
      if @fragment
        str << '#'.freeze
        str << @fragment
      end
      str
    end

  end
end
