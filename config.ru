require "rubygems"
require "bundler"
Bundler.require :default

require "shorty"

# use Rack::Lint
use Rack::ContentLength
use Rack::Logger

# example potential use as middleware:
# use Shorty::App, :path => "/shorty"
# run MyApp

run Shorty::App.new
