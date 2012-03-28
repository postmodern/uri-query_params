require 'spec_helper'
require 'query_params_mixin_examples'
require 'uri/query_params/extensions/uri'

describe URI::HTTP do
  let(:uri) { URI('http://www.example.com/page.php') }

  it_should_behave_like "URI::QueryParams::Mixin"
end
