ActiveAdmin.register Organisation do
	
	config.clear_sidebar_sections!
  index do
  	column :name
  	column :user_id
    column "Amount", :amount
  end
# index OrganisationMoney do|organisationooney|
#   column "Amount", :total_amount,:collection=> OrganisationMoney.select(:id).map(&:id).uniq
# end
  form do |f|
    f.inputs "Organisation Details" do
      f.input :name
      f.input :user_id, :as => :select ,:collection=> User.select(:id).map(&:id).uniq
      f.input :amount
  end
    f.actions
  end
end
