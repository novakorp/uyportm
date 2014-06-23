class EmployeesController < ApplicationController
	def new
		@employee = Employee.new
	end
	
	def create
	  @employee = Employee.new(params[:employee])

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
	 
	 if @employee.update_attributes(params[:employee].permit(:first_name, :last_name, :personal_id, :personal_id_type))
		redirect_to @employee
	  else
		render 'edit'
	 end
	end

	def destroy
	  @employee = Employee.find(params[:id])
	  @employee.destroy
	 
	  redirect_to employees_path
	end
	
end
