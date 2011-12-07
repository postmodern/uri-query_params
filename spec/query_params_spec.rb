require 'spec_helper'
require 'uri/query_params'

require 'uri'

describe URI::QueryParams do
  describe "parse" do
    it "should not parse an empty String" do
      subject.parse('').should be_empty
    end

    it "should not parse empty params" do
      subject.parse('a&&&b').should == {'a' => '', 'b' => ''}
    end

    it "should parse a single query param name" do
      subject.parse('x').should have_key('x')
    end

    it "should parse a query param with an empty value" do
      query_params = subject.parse('x=')

      query_params.should have_key('x')
      query_params['x'].should be_empty
    end

    it "should URI decode query param values" do
      query_params = subject.parse('x=1%202')

      query_params['x'].should == '1 2'
    end

    it "should ignore multiple '=' characters in query param values" do
      query_params = subject.parse('x=1=2')

      query_params['x'].should == '1=2'
    end

    it "should parse multiple query params" do
      query_params = subject.parse('x=1&y=2')

      query_params['x'].should == '1'
      query_params['y'].should == '2'
    end

    context "when given a block" do
      it "should yield the duplicate named query params" do
        params = []

        subject.parse('z=1&z=2&z=3') do |name,value|
          params << [name, value]
        end

        params.should == [['z', '1'], ['z', '2'], ['z', '3']]
      end

      it "should yield the query params in the order they are parsed" do
        params = []

        subject.parse('z=1&y=2&x=3') do |name,value|
          params << [name, value]
        end

        params.should == [['z', '1'], ['y', '2'], ['x', '3']]
      end
    end
  end

  describe "dump" do
    it "should not dump an empty Hash" do
      subject.dump({}).should be_empty
    end

    it "should dump query params with no values" do
      subject.dump({'x' => nil}).should == 'x='
    end

    it "should dump query params with empty values" do
      subject.dump({'x' => ''}).should == 'x='
    end

    it "should dump query params with true values" do
      subject.dump({'x' => true}).should == 'x=active'
    end

    it "should dump query params with non String values" do
      subject.dump({'x' => 1}).should == 'x=1'
    end

    it "should dump query params with Array values" do
      subject.dump({'x' => [1,2]}).should == 'x=1%202'
    end

    it "should dump multiple query params" do
      subject.dump({'x' => '1', 'y' => '2'}).should == 'x=1&y=2'
    end
  end
end
