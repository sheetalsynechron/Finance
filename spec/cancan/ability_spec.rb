require 'spec_helper'
require "cancan/matchers"

describe "Ability" do


     describe "as normal user" do
      before(:each) do
      @organisation = Factory(:organisation)
      @user = Factory(:user)
      @ability = Ability.new(@user)
      end

      it "can not modify organisation" do
        @ability.should_not be_able_to(:read, @organisation)
        @ability.should_not be_able_to(:destroy, @organisation)
        @ability.should_not be_able_to(:edit, @organisation)
        @ability.should_not be_able_to(:create, @organisation)
      end
   end

   describe "as superadmin" do
      before(:each) do
      @organisation = Factory(:organisation)
      @user = Factory(:superadmin)
      @ability = Ability.new(@user)
      end

      it "can manage all" do
        @ability.should be_able_to(:manage, @organisation, @user)  
      end
   end

   describe "as an admin" do
      before(:each) do
      @organisation = Factory(:organisation)
      @user = Factory(:admin)
      @ability = Ability.new(@user)
      @money_calculation =Factory.build(:money_calculation)
     
      end

       it "for his own organisation" do
       @ability.should_not be_able_to(:read, @organisation)
       @ability.should be_able_to(:read, @money_calculation , :user_id => @user.id)
       #@ability.should be_able_to(:show, Factory.build(:episode, :published_at => 2.days.ago))
       end
   end
end