class OrganisationMoneyController < ApplicationController
 
  def index
  	#.where(:organisation_id => params[:organisation_id])
  @organisation_money = OrganisationMoney.where(:organisation_id => params[:organisation_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organisation_money }
    end  

  end
end
