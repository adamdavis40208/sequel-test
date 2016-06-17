require 'sequel'
require 'dotenv'
require 'fixture_dependencies/rspec/sequel'
Dotenv.load

DB = Sequel.connect(ENV["DATABASE_URL"])

Dir[File.join(File.dirname(__FILE__),'model','*.rb')].
    each { |model| require model }

require 'fixture_dependencies'
FixtureDependencies.fixture_path = File.join(File.dirname(File.expand_path(__FILE__)), 'fixtures')