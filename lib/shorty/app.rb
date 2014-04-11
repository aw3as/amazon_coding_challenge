module Shorty
  class App

    # Public: handle a request to the application
    #
    # env - The rack request environment, containing the CGI parameters given by
    #       the application server. This includes params, the request URI,
    #       remote hostname, etc.
    #
    #       Rack includes a helper that wraps this for easier access. E.g.
    #
    #         # assuming a GET to /foobar?hello=world
    #         request = Rack::Request.new(env)
    #         request.request_method # => "GET"
    #         request.base_url       # => "http://example.org"
    #         request.params         # => {"hello" => "world"}
    #         request.path_info      # => "/foobar"
    #
    # Returns an Array with three elements:
    #   - response code
    #   - a hash of headers
    #   - the response body
    #
    #   e.g: [200, {"Content-type" => "text/plain"}, "hello world!"]
    #

    def call(env)
      request = Rack::Request.new(env)
      [ 201, { }, '/' ]
    end
    
  end
end
