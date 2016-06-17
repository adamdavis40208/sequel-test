require 'sequel'
require 'dotenv'
require 'fixture_dependencies/rspec/sequel'
require 'rack/test'

require File.expand_path '../../app.rb', __FILE__

Dotenv.load

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

DB = Sequel.connect(ENV["DATABASE_URL"])

Dir[File.join(File.dirname(__FILE__),'model','*.rb')].
    each { |model| require model }

require 'fixture_dependencies'
FixtureDependencies.fixture_path = File.join(File.dirname(File.expand_path(__FILE__)), 'fixtures')

RSpec.configure { |c| c.include RSpecMixin }