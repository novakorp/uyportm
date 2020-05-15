class GpsPrevInstallationsController < ApplicationController 
  def new
    @gps_prev_inst = GpsPrevInstallation.new
  end
  
  def create
    @gps_prev_inst = GpsPrevInstallation.new(obj_params)

    if @gps_prev_inst.save
    redirect_to @gps_prev_inst
    else
    render 'new'
    end
  end

  def show
    @gps_prev_inst = GpsPrevInstallation.find(params[:id])
  end

  def index
    @gps_prev_insts = GpsPrevInstallation.all
  end

  def edit
    @gps_prev_inst = GpsPrevInstallation.find(params[:id])
  end

  def update
    @gps_prev_inst = GpsPrevInstallation.find(params[:id])
   
   if @gps_prev_inst.update_attributes(params[:gps_prev_installation].permit(:gps_numeric_ident, :gps_descriptive_ident, :gps_plate_number, :retirement_date, :retirement_reason, :original_gps_installation_id, :vehicle_id, :creation_date))
    redirect_to @gps_prev_inst
    else
    render 'edit'
   end
     
  end
 
  def destroy
    @gps_prev_inst = GpsPrevInstallation.find(params[:id])
    @gps_prev_inst.destroy
   
    redirect_to gps_prev_installations_path
  end
  
  private

  def obj_params
    params.require(:gps_prev_installation).permit(:gps_numeric_ident, :gps_descriptive_ident, :gps_plate_number, :retirement_date, :retirement_reason, :original_gps_installation_id, :vehicle_id, :creation_date)
  end
  
end

