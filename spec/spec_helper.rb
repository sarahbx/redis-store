$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "/../lib")))
ARGV << "-b"
require "rubygems"
require "bundler"
Bundler.setup

#require "vendor/gems/environment"
require "ostruct"
require "spec"
require "spec/autorun"
require "redis"
require "merb"
require "rack/cache"
require "rack/cache/metastore"
require "rack/cache/entitystore"
require "redis-store"
require "active_support"
begin
  require "action_controller/session/abstract_store" # Rails 2.3.x
rescue LoadError
  require "action_dispatch/middleware/session/abstract_store" # Rails 3.x
  module Rails; VERSION = "3.0.0.beta3"; end unless defined?(Rails)
end
require "cache/rails/redis_store"
require "rack/session/rails"
require "cache/sinatra/redis_store"

$DEBUG = ENV["DEBUG"] === "true"
