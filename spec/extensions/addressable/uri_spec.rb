require 'spec_helper'
require 'query_params_mixin_examples'
require 'uri/query_params/extensions/addressable/uri'

describe Addressable::URI do
  let(:uri) { described_class.parse('http://www.example.com/page.php') }

  it_should_behave_like "URI::QueryParams::Mixin"
end
