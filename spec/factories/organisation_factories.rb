FactoryGirl.define do
  factory :organisation do |o|
  	o.id 1
  	o.name "synechron"
  	o.user_id 2
  	o.amount 1000

  end
  
  # factory :invalid_organisation, parent: :organisation do |f|
  # 	f.firstname nil
  # end
end
