class GpsInstallationsController < ApplicationController
  def new
    @gps_installation = GpsInstallation.new
  end
  
  def create
    @gps_installation = GpsInstallation.new(obj_params)

    if @gps_installation.save
    redirect_to @gps_installation
    else
    render 'new'
    end
  end

  def show
    @gps_installation = GpsInstallation.find(params[:id])
  end

  def index
    @gps_installations = GpsInstallation.where("active=true").order("gps_numeric_ident")
    @gps_installations_inactive =  GpsInstallation.where("active=false").order("gps_numeric_ident")
  end

  def edit
    @gps_installation = GpsInstallation.find(params[:id])
  end

  def update
    @gps_installation = GpsInstallation.find(params[:id])
   
   if @gps_installation.update_attributes(params[:gps_installation].permit(:gps_numeric_ident, :gps_descriptive_ident, :gps_plate_number, :vehicle_id, :active, :creation_date))
    redirect_to @gps_installation
    else
    render 'edit'
   end
  end
 
  def destroy
    @gps_installation = GpsInstallation.find(params[:id])
    @gps_installation.destroy
   
    redirect_to gps_installations_path
  end
  
  private

  def obj_params
    params.require(:gps_installation).permit(:gps_numeric_ident, :gps_descriptive_ident, :gps_plate_number, :vehicle_id, :active, :creation_date)
  end
  
end
