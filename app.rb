require 'sinatra'
require 'sequel'
require 'dotenv'

class Todo < Sinatra::Application
  configure do
    Dotenv.load
    DB = Sequel.connect(ENV["DATABASE_URL"])
    Dir[File.join(File.dirname(__FILE__),'model','*.rb')].
        each { |model| require model }

  end
end

get '/?' do
  all_users =  User.all
  all_users.to_s
end