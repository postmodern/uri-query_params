require 'uri/query_params/mixin'

require 'uri/http'

module URI
  class HTTP < Generic

    include QueryParams::Mixin

  end
end
