ActiveAdmin.register Organisation do
	
	config.clear_sidebar_sections!
  index do
  	column :name
  	column :user_id 
  end

  form do |f|
    f.inputs "Organisation Details" do
      f.input :name
      f.input :user_id, :as => :select ,:collection=> User.select(:id).map(&:id).uniq
  end
    f.actions
  end

end
