require File.join(File.dirname(File.expand_path(__FILE__)), 'spec_helper')
require_relative '../model/user'

describe User do
  describe "get name" do
    context "given jeremy fixture" do
      it "should be named jeremy" do
        user = load(:user__jeremy)
        expect(user.values[:name].eql? "jeremy")
      end
    end
  end
end