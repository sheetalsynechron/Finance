require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the role" do
  	@user = User.new(:email => 'ok@good.org', :password => '12345678', :role_name => 'user')
    @user.role_name = 'user'
    assert @user.role?('user')    

  end
end
