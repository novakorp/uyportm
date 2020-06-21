class VehicleInspectionsController < ApplicationController 
  def new
    @vehicle_inspection = VehicleInspection.new
  end
  
  def create
    @vehicle_inspection = VehicleInspection.new(obj_params)

    if @vehicle_inspection.save
    redirect_to @vehicle_inspection
    else
    render 'new'
    end
  end

  def show
    @vehicle_inspection = VehicleInspection.find(params[:id])
  end

  def index
    @vehicle_inspections = VehicleInspection.all
  end

  def edit
    @vehicle_inspection = VehicleInspection.find(params[:id])
  end

  def update
    @vehicle_inspection = VehicleInspection.find(params[:id])
   
   if @vehicle_inspection.update_attributes(params[:vehicle_inspection].permit(:m_vehicle_inspection_id, :business_entity_id, :vehicle_id, :address_id, :inst_date_time, :status, :result, :employee_id, :comments))
    redirect_to @vehicle_inspection
    else
    render 'edit'
   end
  end

  def destroy
    @vehicle_inspection = VehicleInspection.find(params[:id])
    @vehicle_inspection.destroy
   
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to vehicle_inspections_path }
      format.js { render "/common/action_result.js" }
    end  
  end
  
  private

  def obj_params
    params.require(:vehicle_inspection).permit(:m_vehicle_inspection_id, :business_entity_id, :vehicle_id, :address_id, :inst_date_time, :status, :result, :employee_id, :comments)
  end 

  
end
