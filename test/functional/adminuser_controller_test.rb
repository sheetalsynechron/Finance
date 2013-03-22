require 'test_helper'

class AdminUserControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  

  # test "testing simple response should work" do 
  #   login users(:one)
  #   get :index 
  #   assert_response :success 
  # end

   test "authorize resource with cancan on register" do
    controller = ActiveAdmin.register(User).controller
    controller.expects(:load_and_authorize_resource)
    ActiveAdmin::Resource.any_instance.stubs(:controller).returns(controller)
    ActiveAdmin.register User
  end
  
  test "display menu only if user can manage given resource" do
    resource = ActiveAdmin.register(User)
    ActiveAdmin::ResourceDSL.any_instance.expects(:can?).with(:manage, User).returns(false)
    assert !resource.namespace.menu.items.first.display_if_block.call
    ActiveAdmin::ResourceDSL.any_instance.expects(:can?).with(:manage, User).returns(true)
    assert resource.namespace.menu.items.first.display_if_block.call
  end 
 
end