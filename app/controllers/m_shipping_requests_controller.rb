class MShippingRequestsController < ApplicationController
	def new
		@m_shipping_request = MShippingRequest.new
	end
	
	def create
	  @m_shipping_request = MShippingRequest.new(obj_params)

	  if @m_shipping_request.save
		redirect_to @m_shipping_request
	  else
		render 'new'
	  end
	end

	def show
	  @m_shipping_request = MShippingRequest.find(params[:id])
	end

	def index
	  @m_shipping_requests = MShippingRequest.all
	end

	def edit
	  @m_shipping_request = MShippingRequest.find(params[:id])
	end

	def update
	  @m_shipping_request = MShippingRequest.find(params[:id])
	 
	 if @m_shipping_request.update_attributes(params[:m_shipping_request].permit(:name, :service_id, :customer_id, :trip_id, :contact, :details, :simple_shipment))
		redirect_to @m_shipping_request
	  else
		render 'edit'
	 end
	end

	def destroy
	  @m_shipping_request = MShippingRequest.find(params[:id])
	  @m_shipping_request.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to m_shipping_requests_path }
      format.js { render "/common/action_result.js" }
    end 
	   
	end
	
	def m_shipping_requests_ac
		@shippings  =  MShippingRequest.where("customer_id = ? AND name iLIKE ?", params[:customer_id],"%#{params[:term]}%")
	end
  
 
	def options_by_customer_id
		@shippings  =  MShippingRequest.find(:all, 
			:conditions => ['customer_id = ?', params[:customer_id]])
	end 
  
  
  def fill_request_order_line		
		@line_num  =  params[:line_num]
        @m_sr = MShippingRequest.find(params[:id])		
	end
	
  private

  def obj_params
    params.require(:m_shipping_request).permit(:name, :service_id, :customer_id, :trip_id, :contact, :details, :simple_shipment)
  end
end
