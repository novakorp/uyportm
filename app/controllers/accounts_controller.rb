class AccountsController < ApplicationController
	def new
		@account = Account.new
	end
	
	def create
	  @account = Account.new(params[:account])

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
	 
	  redirect_to accounts_path
	end
	
	def accounts_by_customer_id
	  if params[:id].present?
		@accounts = Customer.find(params[:id]).accounts
		@element_id = params[:element_id]
	  else
		@accounts = []
	  end
	end

end
