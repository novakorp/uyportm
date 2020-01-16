class CustomersController < ApplicationController
	def new
		@customer = Customer.new
	end
	
	def create
	  @customer = Customer.new(obj_params)

	  if @customer.save
		redirect_to @customer
	  else
		render 'new'
	  end
	end

	def show
	  @customer = Customer.find(params[:id])
	end

	def index
	  @customers = Customer.all
	end

	def edit
	  @customer = Customer.find(params[:id])
	end

	def update
	  @customer = Customer.find(params[:id])
	 
	 if @customer.update_attributes(params[:customer].permit(:name, :rut))
		redirect_to @customer
	  else
		render 'edit'
	 end
	end

	def destroy
	  @customer = Customer.find(params[:id])
	  @customer.destroy
	  
	  @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to customers_path }
      format.js { render "/common/action_result.js" }
    end
	  
	end
	 
	def customers_ac
	  
		@customers  = Customer.where("name iLIKE ? ", "%" + params[:term] + "%")
		
		 respond_to do |format|
        format.js
    end
	end
	
  private

  def obj_params
    params.require(:customer).permit(:name, :rut)
  end
end
