class CompaniesController < ApplicationController
	def new
		@company = Company.new
	end
	
	def create
	  @company = Company.new(params[:company])

	  if @company.save
		redirect_to @company
	  else
		render 'new'
	  end
	end

	def show
	  @company = Company.find(params[:id])
	end

	def index
	  @companies = Company.all
	end

	def edit
	  @company = Company.find(params[:id])
	end

	def update
	  @company = Company.find(params[:id])
	 
	 if @company.update_attributes(params[:company].permit(:company_name, :trade_name, :rut, :mtop, :bps, :mtss))
		redirect_to @company
	  else
		render 'edit'
	 end
	end

	def destroy
	  @company = Company.find(params[:id])
	  @company.destroy
	 
	  redirect_to companys_path
	end
	
end
