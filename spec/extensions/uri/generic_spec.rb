require 'spec_helper'
require 'query_params_mixin_examples'
require 'uri/query_params/extensions/uri'

describe URI::Generic do
  let(:uri) { URI('/page.php') }

  it_should_behave_like "URI::QueryParams::Mixin"
end
