# frozen_string_literal: true

require 'uri/query_params/core_ext/uri/generic'

require 'uri/http'

module URI
  class HTTP < Generic

    alias raw_request_uri request_uri

    #
    # Returns the full path for an HTTP request.
    #
    # @return [String, nil]
    #   The request URI (path + query params) or `nil` if the URI has no
    #   path.
    #
    # @example
    #   uri.path = '/path'
    #   uri.query_params['foo'] = '1'
    #   uri.query_params['bar'] = '2'
    #   uri.request_uri
    #   # => "/path?foo=1&bar=2"
    #
    def request_uri
      if defined?(@query_params) && @query_params && !@query_params.empty?
        return unless @path

        query = URI::QueryParams.dump(@query_params)

        url = "#{@path}?#{query}"
        url = "/#{url}" unless url.start_with?('/')
        url
      else
        raw_request_uri
      end
    end

  end
end
