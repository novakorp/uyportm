class StatesController < ApplicationController
	def new
		@state = State.new
	end
	
	def create
	  @state = State.new(params[:state])

	  if @state.save
		redirect_to @state
	  else
		render 'new'
	  end
	end

	def show
	  @state = State.find(params[:id])
	end

	def index
	  @states = State.all
	end

	def edit
	  @state = State.find(params[:id])
	end

	def update
	  @state = State.find(params[:id])
	 
	 if @state.update_attributes(params[:state].permit(:name, :country))
		redirect_to @state
	  else
		render 'edit'
	 end
	end

	def destroy
	  @state = State.find(params[:id])
	  @state.destroy
	 
	  redirect_to states_path
	end
	
end
