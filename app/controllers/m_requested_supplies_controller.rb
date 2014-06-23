class MRequestedSuppliesController < ApplicationController
	def new		
		@m_requested_cargo = MRequestedCargo.find(params[:m_requested_cargo_id])
		@m_requested_supply = @m_requested_cargo.m_requested_supplies.build 
	end
	
	def create
		@m_requested_cargo = MRequestedCargo.find(params[:m_requested_cargo_id])
		@m_requested_supply = MRequestedSupply.new(params[:m_requested_supply])
		@m_requested_supply.m_requested_cargo_id = @m_requested_cargo.id
		
	  if @m_requested_supply.save
		 redirect_to  @m_requested_cargo 
	  else
		render 'new'
	  end
	end

	def show
	  @m_requested_supply = MRequestedSupply.find(params[:id])
	   
	end

	def edit
	  @m_requested_supply = MRequestedSupply.find(params[:id])	  
	end

	def update
	  @m_requested_supply = MRequestedSupply.find(params[:id])	
	  @m_requested_cargo = @m_requested_supply.m_requested_cargo
	 
	 if @m_requested_supply.update_attributes(params[:m_requested_supply].permit(:ammount, :cargo_type_id, :measure_unit_id,  :address_id))
		redirect_to @m_requested_cargo
	  else
		render 'edit'
	 end
	end

	def destroy
	  @m_requested_supply = MRequestedSupply.find(params[:id])	
	  @m_requested_cargo = @m_requested_supply.m_requested_cargo
	  @m_requested_supply.destroy
	 
	  redirect_to @m_requested_cargo
	end
	
end
