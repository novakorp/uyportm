class MeasureUnitsController < ApplicationController
	def new
		@measure_unit = MeasureUnit.new
	end
	
	def create
	  @measure_unit = MeasureUnit.new(params[:measure_unit])

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
	 
	 if @measure_unit.update_attributes(params[:measure_unit].permit(:name, :symbol))
		redirect_to @measure_unit
	  else
		render 'edit'
	 end
	end

	def destroy
	  @measure_unit = MeasureUnit.find(params[:id])
	  @measure_unit.destroy
	 
	  redirect_to measure_units_path
	end
	
end
