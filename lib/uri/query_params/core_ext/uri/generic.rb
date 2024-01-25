# frozen_string_literal: true

require_relative '../../mixin'

require 'uri/generic'

module URI
  class Generic

    include URI::QueryParams::Mixin

    #
    # Constructs String from URI
    #
    # @note
    #   This is the `URI::Generic#to_s` method from Ruby 3.0.0, with the minor
    #   modification of calling the `query` method overrode by
    #   {URI::QueryParams::Mixin}, instead of `@query`.
    #
    # @see https://github.com/ruby/ruby/blob/v3_0.0/lib/uri/generic.rb#L1330-L1368
    #
    def to_s
      str = ''.dup
      if @scheme
        str << @scheme
        str << ':'
      end

      if @opaque
        str << @opaque
      else
        if @host || %w[file postgres].include?(@scheme)
          str << '//'
        end
        if self.userinfo
          str << self.userinfo
          str << '@'
        end
        if @host
          str << @host
        end
        if @port && @port != self.default_port
          str << ':'
          str << @port.to_s
        end
        str << @path
        if (query = self.query)
          str << '?'
          str << query
        end
      end
      if @fragment
        str << '#'
        str << @fragment
      end
      str
    end

  end
end
