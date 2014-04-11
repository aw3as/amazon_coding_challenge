require "spec_helper"

describe Shorty::App do

  include Rack::Test::Methods

  # Equivalent to
  #
  # def app
  #   @app ||= Shorty::App.new
  # end
  #
  # And implicitly used by "get" and "post" test helper methods
  let(:app)  { Shorty::App.new }

  let(:url)  { "http://foobar.com/stuff" }
  let(:hash) { Digest::SHA1.hexdigest(url)[0..7] }

  describe "POST /" do

    before :each do
      post "/", :url => url
    end

    it "returns a successful response" do
      last_response.status.should == 200
    end

    it "accepts a URL and returns the shortened url as the response body" do
      last_response.body.should == "#{last_request.base_url}/#{hash}"
    end

  end

  describe "GET /<hash>" do

    context "with a previously shortened url" do

      before :each do
        post "/", :url => url # shorten the url first
        @path = URI.parse(last_response.body).path
      end

      it "redirects to the original version of a shortened path" do
        get @path
        last_response.status.should == 302
        last_response.headers["Location"].should == url
      end
    end

    context "with an unknown url" do

      it "returns a 404 for an unknown shortened url" do
        get "/where_does_this_go"
        last_response.status.should == 404
      end

    end

  end

end
