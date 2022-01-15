require 'spec_helper'
require 'uri/query_params/extensions/uri'

describe 'uri/query_params/extensions/uri' do
  let(:root) { File.expand_path(File.join('..','..'),__dir__) }
  let(:path) { File.join(root,'lib','uri','query_params','core_ext', 'uri.rb') }

  it "must require 'uri/query_params/core_ext/uri'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
