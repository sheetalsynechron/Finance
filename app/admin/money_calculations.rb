ActiveAdmin.register MoneyCalculation do

	config.clear_sidebar_sections!
  controller.authorize_resource  
config.clear_action_items!
 index do
  if can? :read, MoneyCalculation
  	column "Donation Date", :created_at 
    column "Donated Amount", :calculation_amount 
    column "Organisation", :organisation_name 
    column "User", :user_id
   end
  end
end
