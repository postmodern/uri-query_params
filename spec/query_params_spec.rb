require 'spec_helper'
require 'uri/query_params'

require 'uri'

describe URI::QueryParams do
  describe "parse" do
    it "should not parse an empty String" do
      expect(subject.parse('')).to be_empty
    end

    it "should not parse empty params" do
      expect(subject.parse('a&&&b')).to eq({'a' => '', 'b' => ''})
    end

    it "should parse a single query param name" do
      expect(subject.parse('x')).to have_key('x')
    end

    it "should parse a query param with an empty value" do
      query_params = subject.parse('x=')

      expect(query_params).to have_key('x')
      expect(query_params['x']).to be_empty
    end

    it "should URI decode query param values" do
      query_params = subject.parse('x=1%202')

      expect(query_params['x']).to eq('1 2')
    end

    it "should ignore multiple '=' characters in query param values" do
      query_params = subject.parse('x=1=2')

      expect(query_params['x']).to eq('1=2')
    end

    it "should parse multiple query params" do
      query_params = subject.parse('x=1&y=2')

      expect(query_params['x']).to eq('1')
      expect(query_params['y']).to eq('2')
    end

    context "when given a block" do
      it "should yield the duplicate named query params" do
        params = []

        subject.parse('z=1&z=2&z=3') do |name,value|
          params << [name, value]
        end

        expect(params).to eq([['z', '1'], ['z', '2'], ['z', '3']])
      end

      it "should yield the query params in the order they are parsed" do
        params = []

        subject.parse('z=1&y=2&x=3') do |name,value|
          params << [name, value]
        end

        expect(params).to eq([['z', '1'], ['y', '2'], ['x', '3']])
      end
    end
  end

  describe "dump" do
    it "should not dump an empty Hash" do
      expect(subject.dump({})).to be_empty
    end

    it "should dump query params with no values" do
      expect(subject.dump({'x' => nil})).to eq('x=')
    end

    it "should dump query params with empty values" do
      expect(subject.dump({'x' => ''})).to eq('x=')
    end

    it "should dump query params with true values" do
      expect(subject.dump({'x' => true})).to eq('x=active')
    end

    it "should dump query params with non String values" do
      expect(subject.dump({'x' => 1})).to eq('x=1')
    end

    it "should dump query params with Array values" do
      expect(subject.dump({'x' => [1,2]})).to eq('x=1%202')
    end

    it "should dump multiple query params" do
      expect(subject.dump({'x' => '1', 'y' => '2'})).to eq('x=1&y=2')
    end
  end
end
