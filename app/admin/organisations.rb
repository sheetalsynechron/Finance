
ActiveAdmin.register Organisation do
  
  config.clear_sidebar_sections!
  controller.authorize_resource  
    menu :if => proc{ can? :read, Organisation }

  index do
    column :name
    column :user_id
    column "Amount", :amount
     default_actions
  end
 form(:html => {:multipart => true})do |f|

      f.inputs "Organisation Details" do
      f.input :name
      f.input :user_id,:as => :hidden
      f.input :amount
     f.input :image

    end

      f.inputs "User Details" ,:for =>[:user ,f.object.user || User.new]do|user_form|
      user_form.input :email
      user_form.input :password
      user_form.input :password_confirmation
      user_form.input :first_name
      user_form.input :last_name
      user_form.input :role_name, :as => :hidden, :value => "admin"
    end     
    f.actions
  end

    delete = Proc.new {
      super
    @user = User.find_or_create_by_id(params[:id])
    
      if @user.delete
        redirect_to :action => :show, :id => @user.id
      else
        render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
      end
  }

  member_action :delete, :method => :post, & delete
end
 