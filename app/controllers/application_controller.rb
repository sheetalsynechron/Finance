class ApplicationController < ActionController::Base
  protect_from_forgery
 
	# rescue_from CanCan::AccessDenied do |exception|
 #    redirect_to  admin_dashboard_path, :alert => exception.message
 #  end
rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    	redirect_to(request.referer)
end
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end 
end
