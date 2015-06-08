require 'spec_helper'
require 'uri/query_params'

require 'uri'

shared_examples_for "URI::QueryParams::Mixin" do
  let(:query) { 'x=1&y=one%20two&z' }

  subject { uri }

  before(:each) { uri.query = query }

  it "should include QueryParams" do
    expect(subject.class).to include(URI::QueryParams::Mixin)
  end

  it "should still provide access to #query" do
    expect(uri.query).to eq(query)
  end

  it "should provide #query_params" do
    is_expected.to respond_to(:query_params)
  end

  it "should update #query_params after #query is set" do
    subject.query = 'u=2'
    expect(subject.query_params['u']).to eq('2')
  end

  it "should dump out the #query_params when accessing #query" do
    subject.query_params = {'u' => '3'}
    expect(subject.query).to eq('u=3')
  end

  it "should properly escape query param values" do
    subject.query_params = {'x' => '1&2', 'y' => 'one=two', 'z' => '?'}

    expect(subject.to_s.match(/\?(.+)$/)[1]).to eq("x=1%262&y=one%3Dtwo&z=%3F")
  end

  it "should deep-copy the query_params Hash" do
    original = subject.query_params.object_id

    expect(subject.dup.query_params.object_id).not_to eq(original)
    expect(subject.clone.query_params.object_id).not_to eq(original)
  end

  describe "#query_params" do
    subject { uri.query_params }

    it "should be a Hash" do
      expect(subject.class).to eq(Hash)
    end

    it "should contain params" do
      is_expected.not_to be_empty
    end

    it "can contain single-word params" do
      expect(subject['x']).to eq('1')
    end

    it "can contain multi-word params" do
      expect(subject['y']).to eq('one two')
    end

    it "can contain empty params" do
      expect(subject['z']).to be_empty
    end
  end
end
