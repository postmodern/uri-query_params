require 'spec_helper'
require 'uri/query_params/extensions'

describe 'uri/query_params/extensions' do
  let(:root) { File.expand_path('..',__dir__) }
  let(:path) { File.join(root,'lib','uri','query_params','core_ext.rb') }

  it "must require 'uri/query_params/core_ext'" do
    expect($LOADED_FEATURES).to include(path)
  end
end
