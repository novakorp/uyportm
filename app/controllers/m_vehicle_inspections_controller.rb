class MMVehicleInspectionsController < ApplicationController 
  def new
    @m_m_vehicle_inspection = MVehicleInspection.new
  end
  
  def create
    @m_m_vehicle_inspection = MVehicleInspection.new(obj_params)

    if @m_m_vehicle_inspection.save
    redirect_to @m_m_vehicle_inspection
    else
    render 'new'
    end
  end

  def show
    @m_m_vehicle_inspection = MVehicleInspection.find(params[:id])
  end

  def index
    @m_m_vehicle_inspections = MVehicleInspection.all
  end

  def edit
    @m_m_vehicle_inspection = MVehicleInspection.find(params[:id])
  end

  def update
    @m_m_vehicle_inspection = MVehicleInspection.find(params[:id])
   
   if @m_m_vehicle_inspection.update_attributes(params[:m_vehicle_inspection].permit(:name,  :business_entity_id, :address_id, :inspection_type, :comments))
    redirect_to @m_m_vehicle_inspection
    else
    render 'edit'
   end
  end

  def destroy
    @m_m_vehicle_inspection = MVehicleInspection.find(params[:id])
    @m_m_vehicle_inspection.destroy
   
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to m_vehicle_inspections_path }
      format.js { render "/common/action_result.js" }
    end  
  end
  
  private

  def obj_params
    params.require(:m_vehicle_inspection).permit(:name,  :business_entity_id, :address_id, :inspection_type, :comments)
  end 
 
end
