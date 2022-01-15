require 'spec_helper'
require 'uri/query_params/extensions/addressable/uri'

describe 'uri/query_params/extensions/addressable/uri' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) do
    File.join(root,'lib','uri','query_params','core_ext', 'addressable','uri.rb')
  end

  it "must require 'uri/query_params/core_ext/addressable/uri'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
