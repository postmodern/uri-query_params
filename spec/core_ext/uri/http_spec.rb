require 'spec_helper'
require 'query_params_mixin_examples'
require 'uri/query_params/core_ext/uri/http'

describe URI::HTTP do
  subject { URI.parse("http://www.example.com/page.php") }

  it_should_behave_like "URI::QueryParams::Mixin"

  describe "#request_uri" do
    context "when #query_params is set" do
      let(:query_params) do
        {'x' => '1', 'y' => '2'}
      end

      before { subject.query_params = query_params }

      context "and when #path is set" do
        it "must return the #path and #query_params" do
          expect(subject.request_uri).to eq("#{subject.path}?x=#{query_params['x']}&y=#{query_params['y']}")
        end

        context "but #path does not start with a '/' character" do
          subject { URI.parse("http://www.example.com") }

          it "must prepend a '/' character" do
            expect(subject.request_uri).to eq("/#{subject.path}?x=#{query_params['x']}&y=#{query_params['y']}")
          end
        end
      end

      context "but #path is not set" do
        before { subject.path = nil }

        it "must return nil" do
          expect(subject.request_uri).to be(nil)
        end
      end
    end

    context "when #query_params is not set" do
      context "and when #path is set" do
        context "and when #query is set" do
          let(:query) { 'x=1&y=2' }

          subject { URI("http://www.example.com/page.php?#{query}") }

          it "must return the #path and #query" do
            expect(subject.request_uri).to eq("#{subject.path}?#{subject.query}")
          end
        end

        context "but when #query is not set" do
          it "must return #path" do
            expect(subject.request_uri).to eq(subject.path)
          end
        end

        context "but #path does not start with a '/' character" do
          subject { URI.parse("http://www.example.com") }

          it "must prepend a '/' character" do
            expect(subject.request_uri).to eq("/#{subject.path}")
          end
        end
      end

      context "but #path is not set" do
        before { subject.path = nil }

        it "must return nil" do
          expect(subject.request_uri).to be(nil)
        end
      end
    end
  end
end
