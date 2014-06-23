class CargoCategoriesController < ApplicationController
	def new
		@cargo_category = CargoCategory.new
	end
	
	def create
	  @cargo_category = CargoCategory.new(params[:cargo_category])

	  if @cargo_category.save
		redirect_to @cargo_category
	  else
		render 'new'
	  end
	end

	def show
	  @cargo_category = CargoCategory.find(params[:id])
	end

	def index
	  @cargo_categories = CargoCategory.all
	end

	def edit
	  @cargo_category = CargoCategory.find(params[:id])
	end

	def update
	  @cargo_category = CargoCategory.find(params[:id])
	 
	 if @cargo_category.update_attributes(params[:cargo_category].permit(:description))
		redirect_to @cargo_category
	  else
		render 'edit'
	 end
	end

	def destroy
	  @cargo_category = CargoCategory.find(params[:id])
	  @cargo_category.destroy
	 
	  redirect_to cargo_categories_path
	end
	
end
