require 'spec_helper'
require 'query_params_mixin_examples'

describe URI::HTTP do
  subject { URI.parse("http://www.example.com/page.php") }

  it_should_behave_like "URI::QueryParams::Mixin"
end
