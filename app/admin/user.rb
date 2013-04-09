ActiveAdmin.register User do


controller.authorize_resource

menu :if => proc{ can? :manage, User }
index do
    column :email
    column :sign_in_count
    column :created_at
    column :role_name
    column :first_name
    column :last_name
  end
  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :role_name, :label => "Role"
    end
    f.actions
  end

  create_or_edit = Proc.new {
    @user            = User.find_or_create_by_id(params[:id])

    @user.attributes = params[:user].delete_if do |k, v|
      (k == "superadmin") ||
          (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if verify_recaptcha
      if @user.save
        redirect_to :action => :show, :id => @user.id
      else
        render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
      end
    else
      flash.now[:alert] = "There is an error with the recaptcha code below. Please re-enter the code."      
      flash.delete :recaptcha_error 
      render "new"
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit
end