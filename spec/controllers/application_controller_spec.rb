require 'spec_helper'
# require "cancan/matchers"
 describe ApplicationController do
 	describe "current_ability" do
 		
      before(:each) do
      @organisation = Factory(:organisation)
      @user = Factory(:user)
      @current_ability = Ability.new(@user)
      end

      it "should assign current ability to current user" do
      ApplicationController.stub(:current_ability){ @current_ability }
      @current_ability.should_not be_able_to(:read, @organisation)
      @current_ability.should_not be_able_to(:destroy, @organisation)
      @current_ability.should_not be_able_to(:edit, @organisation)
      @current_ability.should_not be_able_to(:create, @organisation)
 	end
 end

end