class AccountsController < ApplicationController
	def new
		@account = Account.new
	end
	
	def create
	  @account = Account.new(obj_params)

	  if @account.save
		redirect_to @account
	  else
		render 'new'
	  end
	end

	def show
	  @account = Account.find(params[:id])
	end

	def index
	  @accounts = Account.all
	end

	def edit
	  @account = Account.find(params[:id])
	end

	def update
	  @account = Account.find(params[:id])
	 
	 if @account.update_attributes(params[:account].permit(:description, :account_number, :customer_id))
		redirect_to @account
	  else
		render 'edit'
	 end
	end

	def destroy
	  @account = Account.find(params[:id])
	  @account.destroy 
 
    @action_result_code="1"
    @action_result_desc="OK"
    @action_result_data="{}"
      
    respond_to do |format|
      format.html { redirect_to accounts_path }
      format.js { render "/common/action_result.js" }
    end 
	end
	
	def accounts_by_customer_id
	  if params[:id].present?
		  @accounts = Customer.find(params[:id]).accounts
		  @element_id = params[:element_id]
	  else
		  @accounts = []
	  end


	end
  
  private

  def obj_params
    params.require(:account).permit(:description, :account_number, :customer_id)
  end

end
