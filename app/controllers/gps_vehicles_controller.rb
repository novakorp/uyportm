class GpsVehiclesController < ApplicationController
  def new
    @gps_vehicle = GpsVehicle.new
  end
  
  def create
    @gps_vehicle = GpsVehicle.new(obj_params)

    if @gps_vehicle.save
    redirect_to @gps_vehicle
    else
    render 'new'
    end
  end

  def show
    @gps_vehicle = GpsVehicle.find(params[:id])
  end

  def index
    @gps_vehicles = GpsVehicle.all
  end

  def edit
    @gps_vehicle = GpsVehicle.find(params[:id])
  end

  def update
    @gps_vehicle = GpsVehicle.find(params[:id])
   
   if @gps_vehicle.update_attributes(params[:gps_vehicle].permit(:gps_numeric_ident, :gps_descriptive_ident, :gps_plate_number, :vehicle_id, :creation_date))
    redirect_to @gps_vehicle
    else
    render 'edit'
   end
  end
 
  def destroy
    @gps_vehicle = GpsVehicle.find(params[:id])
    @gps_vehicle.destroy
   
    redirect_to gps_vehicles_path
  end
  
  private

  def obj_params
    params.require(:gps_vehicle).permit(:gps_numeric_ident, :gps_descriptive_ident, :gps_plate_number, :vehicle_id, :creation_date)
  end
  
end
