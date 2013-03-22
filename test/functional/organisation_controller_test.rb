require 'test_helper'

class OrganisationControllerTest < ActionController::TestCase
	include Devise::TestHelpers
    include CanCan::Ability
    

  test "should get index" do
  	login users (:one)
    get :index
    assert_response :success
  end

  test "show organisations" do
  	
  	organisation = Organisation.new(:id => 1,:name => 'synechron', :user_id => 1, :amount => 100)
  	admin = User.new(:id => 1, :email => 'admin@good.org', :password => '12345678', :role_name => 'admin')
  	login admin
  	get :show, :id => organisation.id
    assert_template 'show'
    
  end

  test "for calculate and save" do
   @money_calculation = MoneyCalculation.new(:calculation_amount => 1000, :organisation_id => 1, :user_id => 1)
   @organisation = Organisation.new(:name => 'synechron', :user_id => 1, :amount => 100)
   @cal_amt = @money_calculation.calculation_amount + @organisation.amount
    assert @organisation.update_attributes(:amount => @cal_amt)
   @organisation.reload
   assert_equal(@cal_amt, @organisation.amount, msg="Donation successfull.")
   #assert_redirected_to(root_url, msg="Donation successfull.")
   assert_response(200)

  end

end
