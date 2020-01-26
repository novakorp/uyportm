class StatesController < ApplicationController
	def new
		@state = State.new
	end
	
	def create
	  @state = State.new(obj_params)

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
	 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to states_path }
      format.js { render "/common/action_result.js" }
    end  
	end
	
  private

  def obj_params
    params.require(:state).permit(:name, :country)
  end
end
