# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "My app" do
  it "should list all users at /" do
    get '/'
    expect(last_response).to be_ok
    #this user should be included in the db migrations
    expect(last_response.body.include? "name=>\"asdf\"")
  end

  it "should give a hello world to asdf" do
    get "/users/asdf"
    expect(last_response).to be_ok
    expect(last_response.body.include? "asdf")
  end

  it "should give a user not found text" do
    get "/users/lajhsdflkjahsdflkjhasdlkfjhalsdklahjsdflkajhsdf"
    expect(last_response).to be_ok
    expect(last_response.body.include? "user not found")
  end
end