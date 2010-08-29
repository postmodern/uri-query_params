require 'spec_helper'
require 'uri/query_params/extensions/http'

describe URI::HTTP do
  it "should include QueryParams" do
    URI::HTTP.should include(URI::QueryParams::Mixin)
  end
end
