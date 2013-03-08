require 'test_helper'

class OrganizationMoneyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
