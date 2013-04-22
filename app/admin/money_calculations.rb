ActiveAdmin.register MoneyCalculation do

	config.clear_sidebar_sections!
  controller.authorize_resource  

 menu :if => proc{ can? :read, MoneyCalculation }
 index do
    column "Donated Amount", :calculation_amount 
    column "Organisation", :organisation_name 
    column "User", :user_name 
    column "Donated At", :created_at 
   end
end
