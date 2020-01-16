class SimpleShippingsController < ApplicationController
    def new
    @simple_shipping = SimpleShipping.new
  end
  
  def create
    @simple_shipping = SimpleShipping.new(obj_params)

    if @simple_shipping.save
    redirect_to @simple_shipping
    else
    render 'new'
    end
  end

  def show
    @simple_shipping = SimpleShipping.find(params[:id])
  end

  def index
    @simple_shippings = SimpleShipping.all
  end

  def edit
    @simple_shipping = SimpleShipping.find(params[:id])
  end

  def update
    @simple_shipping = SimpleShipping.find(params[:id])
   
   if @simple_shipping.update_attributes(params[:simple_shipping].permit(:shpment_date, :vehicle_id, :coupled_vehicle_id, :company_id,
     :driver_id, :m_shipping_request_id, :amount, :measure_unit_id, :unit_price, :documents, :return_type_id, :comments, :invoice_number, :description))
    redirect_to @simple_shipping
    else
    render 'edit'
   end
  end

  def destroy
    @simple_shipping = SimpleShipping.find(params[:id])
    @simple_shipping.destroy
   
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to simple_shippings_path }
      format.js { render "/common/action_result.js" }
    end  
  end
  
  private

  def obj_params
    params.require(:simple_shipping).permit(:shpment_date, :vehicle_id, :coupled_vehicle_id, :company_id,
     :driver_id, :m_shipping_request_id, :amount, :measure_unit_id, :unit_price, :documents, :return_type_id, :comments, :invoice_number, :description)
  end
end
