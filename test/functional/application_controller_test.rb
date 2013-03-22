require 'test_helper'
class ApplicationControllerTest < ActionController::TestCase
	include Devise::TestHelpers
	include CanCan::Ability

	
test "for assigning the current_ability" do
  	user = User.new(:email => 'ok@good.org', :password => '12345678', :role_name => 'user')
  	@current_ability = Ability.new(user)
    assert_instance_of(Ability, @controller.current_ability, :message)  
end


# test "should redirect back for error raised" do
#   login :one

#   assert default_user.role? :user
#   assert_raise(CanCan::AccessDenied) { get :new }
#   assert_redirected_to root_path
# end

end
