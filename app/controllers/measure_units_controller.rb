class MeasureUnitsController < ApplicationController
  
	def new
		@measure_unit = MeasureUnit.new
	end
	
	def create
	  @measure_unit = MeasureUnit.new(obj_params)

    puts params

	  if @measure_unit.save
		redirect_to @measure_unit
	  else
		render 'new'
	  end
	end

	def show
	  @measure_unit = MeasureUnit.find(params[:id])
	end

	def index
	  @measure_units = MeasureUnit.all
	end

	def edit
	  @measure_unit = MeasureUnit.find(params[:id])
	end

	def update
	  @measure_unit = MeasureUnit.find(params[:id])
	 
	 puts params
	 
	 if @measure_unit.update_attributes(params[:measure_unit].permit(:name, :symbol))
		redirect_to @measure_unit
	  else
		render 'edit'
	 end
	end

	def destroy
	  @measure_unit = MeasureUnit.find(params[:id])
	  @measure_unit.destroy
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to measure_units_path }
      format.js { render "/common/action_result.js" }
    end 
     
	end
	
  private

  def obj_params
    params.require(:measure_unit).permit(:name, :symbol)
  end
end
