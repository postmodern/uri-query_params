# frozen_string_literal: true

require 'uri/query_params/mixin'

require 'addressable/uri'

module Addressable
  class URI

    include ::URI::QueryParams::Mixin

  end
end
