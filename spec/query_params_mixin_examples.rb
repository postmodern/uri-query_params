require 'spec_helper'
require 'uri/query_params'

require 'uri'

shared_examples_for "URI::QueryParams::Mixin" do
  let(:query) { 'x=1&y=one%20two&z' }

  before { subject.query = query }

  context "when included" do
    it "should include QueryParams::Mixin" do
      expect(subject.class).to include(URI::QueryParams::Mixin)
    end

    it "should still provide access to #query" do
      expect(subject.query).to eq(query)
    end

    it "should provide #query_params" do
      expect(subject).to respond_to(:query_params)
    end
  end

  context "when copied" do
    it "should deep-copy the query_params Hash" do
      original = subject.query_params.object_id

      expect(subject.dup.query_params.object_id).not_to eq(original)
      expect(subject.clone.query_params.object_id).not_to eq(original)
    end
  end

  describe "#query=" do
    it "should update #query_params after #query is set" do
      subject.query = 'u=2'

      expect(subject.query_params['u']).to eq('2')
    end
  end

  describe "#query" do
    it "should dump out the #query_params when accessing #query" do
      subject.query_params = {'u' => '3'}

      expect(subject.query).to eq('u=3')
    end

    it "should properly escape query param values" do
      subject.query_params = {'x' => '1&2', 'y' => 'one=two', 'z' => '?'}

      expect(subject.query).to eq("x=1%262&y=one%3Dtwo&z=%3F")
    end
  end

  describe "#to_s" do
    it "should include the #query_params" do
      expect(subject.to_s.split('?',2).last).to eq(query)
    end
  end

  describe "#query_params" do
    it "should be a Hash" do
      expect(subject.query_params.class).to eq(Hash)
    end

    it "should contain params" do
      expect(subject.query_params).not_to be_empty
    end

    it "can contain single-word params" do
      expect(subject.query_params['x']).to eq('1')
    end

    it "can contain multi-word params" do
      expect(subject.query_params['y']).to eq('one two')
    end

    it "can contain empty params" do
      expect(subject.query_params['z']).to be_empty
    end
  end
end
