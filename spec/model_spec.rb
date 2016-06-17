require File.join(File.dirname(File.expand_path(__FILE__)), 'spec_helper')
require_relative '../model/user'

describe User do
  context "given jeremy fixture" do
    context "get name" do
      it "should be named jeremy" do
        user = load(:user__jeremy)
        expect(user.values[:name].eql? "jeremy")
      end
    end
    context "get password" do
      it "should be passworded asdf" do
        user = load(:user__jeremy)
        expect(user.values[:password].eql? "asdf")
      end
    end
  end
end