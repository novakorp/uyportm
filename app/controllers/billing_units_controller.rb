class BillingUnitsController < ApplicationController
	def new
		@billing_unit = BillingUnit.new
	end
	
	def create
	  @billing_unit = BillingUnit.new(obj_params)

	  if @billing_unit.save
		redirect_to @billing_unit
	  else
		render 'new'
	  end
	end

	def show
	  @billing_unit = BillingUnit.find(params[:id])
	end

	def index
	  @billing_units = BillingUnit.all
	end

	def edit
	  @billing_unit = BillingUnit.find(params[:id])
	end

	def update
	  @billing_unit = BillingUnit.find(params[:id])
	 
	 if @billing_unit.update_attributes(params[:billing_unit].permit(:code, :description))
		redirect_to @billing_unit
	  else
		render 'edit'
	 end
	end

	def destroy
	  @billing_unit = BillingUnit.find(params[:id])
	  @billing_unit.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to billing_units_path }
      format.js { render "/common/action_result.js" }
    end 
	end
	
    
  private

  def obj_params
    params.require(:billing_unit).permit(:code, :description)
  end
end
