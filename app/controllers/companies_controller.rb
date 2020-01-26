class CompaniesController < ApplicationController
	def new
		@company = Company.new
	end
	
	def create
	  @company = Company.new(obj_params)

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
	 
	  
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to cargo_companies_path }
      format.js { render "/common/action_result.js" }
    end
   
	end
	
  private

  def obj_params
    params.require(:company).permit(:company_name, :trade_name, :rut, :mtop, :bps, :mtss)
  end
end
