require 'test_helper'
#require "cancan/matchers"

class AbilityTest < ActiveSupport::TestCase

def setup
  user = User.new(:email => 'ok@good.org', :password => '12345678', :role_name => 'user')
  @organisation = Organisation.new(:name => 'synechron', :user_id => 1)
  @ability = Ability.new(user)
  @ability.extend(CanCan::Ability)
  #@controller.stubs(:current_ability).returns(@ability)
end

test "for normal user" do
   assert @ability.cannot(:destroy, @organisation)
   assert @ability.cannot(:read, @organisation )
   assert @ability.cannot(:edit, @organisation)
   assert @ability.cannot(:create, @organisation)
end

test "for superadmin" do
  superadmin = User.new(:email => 'ok@good.org', :password => '12345678', :role_name => 'superadmin')
  ability = Ability.new(superadmin)
  assert ability.can :manage, @organisation
end

test "for admin user" do
   admin = User.new(:id => 1, :email => 'ok@good.org', :password => '12345678', :role_name => 'superadmin')
   ability = Ability.new(admin)
   money_calculations = MoneyCalculation.new(:calculation_amount => 1000, :organisation_id => 1, :user_id => admin.id)
   assert ability.cannot?(:read, @organisation )
   assert ability.can?(:read, Money_calculations.new(:user_id => admin.id))
   assert ability.cannot?(:read, Money_calculations.new)
   end

end
