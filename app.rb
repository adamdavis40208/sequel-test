require 'sinatra'
require 'sequel'
require 'dotenv'

class Todo < Sinatra::Application
  configure do
    Dotenv.load
    DB = Sequel.connect(ENV["DATABASE_URL"])
    Dir[File.join(File.dirname(__FILE__),'model','*.rb')].each { |model| require model }
  end
end

get '/?' do
  all_users =  User.all
  all_users.to_s
end

get '/users/:name/?' do
  user = User.find(name: params[:name])
  if !user.nil?
  "user: " + user.values[:name] +" password: " + user.values[:password]
  else
  "user not found"
  end
end