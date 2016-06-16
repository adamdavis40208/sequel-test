require 'sinatra'
require 'sequel'
class Todo < Sinatra::Application
  configure do
    DB = Sequel.connect("mysql://test:test@localhost/todo")
    Dir[File.join(File.dirname(__FILE__),'model','*.rb')].
        each { |model| require model }
  end
end

get '/?' do
  all_users =  User.all
  all_users.to_s
end