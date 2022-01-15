require 'spec_helper'
require 'uri/query_params/extensions/uri/generic'

describe 'uri/query_params/extensions/uri/generic' do
  let(:root) { File.expand_path(File.join('..','..','..'),__dir__) }
  let(:path) do
    File.join(root,'lib','uri','query_params','core_ext', 'uri','generic.rb')
  end

  it "must require 'uri/query_params/core_ext/uri/generic'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
