ActiveAdmin.register User do

# menu :if => proc{ current_user.can_edit_users? }
 menu :if => proc{ can? :manage, User }
controller.authorize_resource  
  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role_name, :label => "Role",:as => :select ,:collection=> Roles.select(:role_name).map(&:role_name).uniq
      #f.input :admin, :label =>"admin"
      #f.input :user1, :label =>"user"
    end
    f.actions
  end

  create_or_edit = Proc.new {
    @user            = User.find_or_create_by_id(params[:id])
    #@user.superadmin = params[:user][:role_name]
    #@user.admin = params[:user][:admin]
   # @user.user1 = params[:user][:user1]
    @user.attributes = params[:user].delete_if do |k, v|
      (k == "superadmin") ||
          (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit



end