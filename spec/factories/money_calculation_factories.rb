FactoryGirl.define do
	factory :money_calculation do |m|
		m.calculation_amount 1000
		m.user_id 1
		m.organisation_id 1
	end
end