class OrganisationController < ApplicationController
 
before_filter :authenticate_user!
  def index

  	@organisations= Organisation.all
  	 respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @organisation }
    end  
  end

  def show

  @money_calculations = MoneyCalculations.new
  @money_calculations.calculation_amount=params[:calculation_amount]
  @money_calculations.user_id=current_user.id
  @money_calculations.organisation_money_id = params[:org_money_id]
  
    
    respond_to do |format|
      if @money_calculations.save 
        @organisation_money = OrganisationMoney.find(params[:org_money_id])
       @cal_amt = (params[:org_tot_amt]).to_i + (params[:calculation_amount]).to_i
       @organisation_money.total_amount = @cal_amt
      if @organisation_money.update_attributes(:total_amount => @cal_amt)
        format.html { redirect_to root_url, :notice => 'Donation successfull.' }
        format.json { head :no_content }
      else
        format.html { render :action=> "edit" }
        format.json { render :json=> @money_calculations.errors, :status =>:unprocessable_entity }
      end
    end
  end
   
end

end
