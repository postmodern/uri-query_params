require 'spec_helper'
require 'query_params_mixin_examples'
require 'uri/query_params/core_ext/uri'

describe URI::Generic do
  subject { URI.parse('/page.php') }

  it_should_behave_like "URI::QueryParams::Mixin"
end
