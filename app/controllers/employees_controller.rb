class EmployeesController < ApplicationController
	def new
		@employee = Employee.new
	end
	
	def create
	  @employee = Employee.new(obj_params)

	  if @employee.save
		redirect_to @employee
	  else
		render 'new'
	  end
	end

	def show
	  @employee = Employee.find(params[:id])
	end

	def index
	  @employees = Employee.all
	end

	def edit
	  @employee = Employee.find(params[:id])
	end

	def update
	  @employee = Employee.find(params[:id])
	 
	 if @employee.update_attributes(params[:employee].permit(:company_id, :first_name, :last_name, :personal_id, :personal_id_type, :job_type))
		redirect_to @employee
	 else
		render 'edit'
	 end
	end

	def destroy
	  @employee = Employee.find(params[:id])
	  @employee.destroy
   
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to employees_path }
      format.js { render "/common/action_result.js" }
    end 
	end
	
  private

  def obj_params
    params.require(:employee).permit(:company_id, :first_name, :last_name, :personal_id, :personal_id_type, :job_type)
  end
end
